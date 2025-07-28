import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../../services/httpStatusCodes.dart';
import '../../config/app_config.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final Dio _dio;
  final SharedPreferences _prefs;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 300; // 5 dakika = 300 saniye

  PasswordResetBloc(this._dio, this._prefs) : super(PasswordResetInitial()) {
    on<SendPasswordResetCodeRequested>(_onSendPasswordResetCodeRequested);
    on<ResetPasswordWithCodeRequested>(_onResetPasswordWithCodeRequested);
    on<PasswordResetCooldownUpdated>((event, emit) {
      emit(PasswordResetCooldownState(remainingSeconds: event.remainingSeconds, cooldownEmail: _prefs.getString('lastPasswordResetCodeEmail') ?? ''));
    });
    on<LoadPasswordResetCooldown>(_onLoadPasswordResetCooldown);
  }

  // Cooldown süresini Shared Preferences'tan yükleme
  Future<void> _onLoadPasswordResetCooldown(
      LoadPasswordResetCooldown event,
      Emitter<PasswordResetState> emit,
      ) async {
    final String? timestamp = _prefs.getString('lastPasswordResetCodeSent');
    final String? email = _prefs.getString('lastPasswordResetCodeEmail');

    if (timestamp != null && email != null) {
      final lastSentTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final elapsedSeconds = now.difference(lastSentTime).inSeconds;
      int remaining = _cooldownDuration - elapsedSeconds;

      if (remaining > 0) {
        // Cooldown hala aktifse, sayacı başlat ve durumu yayınla
        _startCountdown(remaining);
        emit(PasswordResetCooldownState(remainingSeconds: remaining, cooldownEmail: email));
      } else {
        // Cooldown süresi dolmuşsa temizle
        await _prefs.remove('lastPasswordResetCodeSent');
        await _prefs.remove('lastPasswordResetCodeEmail');
        emit(PasswordResetInitial());
      }
    } else {
      emit(PasswordResetInitial()); // Hiçbir cooldown bilgisi yok
    }
  }

  // Geri sayım sayacını başlatma
  void _startCountdown(int initialSeconds) {
    _countdownTimer?.cancel();
    int remaining = initialSeconds;

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining > 0) {
        remaining--;
        add(PasswordResetCooldownUpdated(remaining)); // Durumu güncelleyen olayı yayınla
      } else {
        _countdownTimer?.cancel();
        // Cooldown süresi bittiğinde SharedPreferences'tan bilgileri temizle
        _prefs.remove('lastPasswordResetCodeSent');
        _prefs.remove('lastPasswordResetCodeEmail');
        emit(PasswordResetInitial()); // Cooldown bittiğinde başlangıç durumuna dön
      }
    });
  }

  // Şifre sıfırlama kodu gönderme işlemi
  Future<void> _onSendPasswordResetCodeRequested(
      SendPasswordResetCodeRequested event,
      Emitter<PasswordResetState> emit,
      ) async {
    emit(PasswordResetLoading()); // Yükleme durumuna geç

    try {
      final response = await _dio.post(
        '${AppConfig.baseUrl}/send-password-reset-code',
        data: {'email': event.email},
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        // Başarılı olursa zaman damgasını ve e-postayı kaydet, geri sayımı başlat
        await _prefs.setString('lastPasswordResetCodeSent', DateTime.now().toIso8601String());
        await _prefs.setString('lastPasswordResetCodeEmail', event.email);
        _startCountdown(_cooldownDuration); // Tam cooldown süresini başlat
        emit(PasswordResetCodeSentSuccess(message: 'Şifre sıfırlama kodu e-posta adresinize gönderildi.', email: event.email));
      } else {
        String errorMessage = "Kod gönderilirken bir hata oluştu.";
        if (response.data != null && response.data is Map && response.data.containsKey('message')) {
          errorMessage = response.data['message'];
        } else if (response.statusCode == 422 && response.data != null && response.data is Map && response.data.containsKey('errors')) {
          Map<String, dynamic> errors = response.data['errors'];
          errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
        } else {
          errorMessage = HttpStatusCodes.getMessage(response.statusCode!);
        }
        emit(PasswordResetError(message: errorMessage));
      }
    } on DioException catch (e) {
      String errorMessage = "Bağlantı sağlanamıyor. Lütfen internet bağlantınızı kontrol edin.";
      if (e.response != null) {
        if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
          errorMessage = e.response!.data['message'];
        } else if (e.response!.statusCode == 422 && e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('errors')) {
          Map<String, dynamic> errors = e.response!.data['errors'];
          errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
        } else {
          errorMessage = "Sunucu hatası: ${e.response!.statusCode}";
        }
      }
      emit(PasswordResetError(message: errorMessage));
    } catch (e) {
      emit(PasswordResetError(message: 'Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}'));
    }
  }

  // Şifreyi kod ile sıfırlama işlemi
  Future<void> _onResetPasswordWithCodeRequested(
      ResetPasswordWithCodeRequested event,
      Emitter<PasswordResetState> emit,
      ) async {
    emit(PasswordResetLoading());

    if (event.code.isEmpty || event.newPassword.isEmpty || event.confirmPassword.isEmpty) {
      emit(const PasswordResetError(message: 'Lütfen tüm alanları doldurun.'));
      return;
    }
    if (event.newPassword != event.confirmPassword) {
      emit(const PasswordResetError(message: 'Şifreler uyuşmuyor.'));
      return;
    }
    if (event.newPassword.length < 8) {
      emit(const PasswordResetError(message: 'Şifre en az 8 karakter olmalı.'));
      return;
    }

    try {
      final response = await _dio.post(
        '${AppConfig.baseUrl}/reset-password-with-code',
        data: {
          'email': event.email,
          'code': event.code,
          'password': event.newPassword,
          'password_confirmation': event.confirmPassword,
        },
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        await _prefs.remove('lastPasswordResetCodeSent'); // Başarılı sıfırlamada cooldown temizle
        await _prefs.remove('lastPasswordResetCodeEmail');
        emit(const PasswordResetSuccess(message: "Şifreniz başarıyla sıfırlandı. Giriş yapabilirsiniz."));
      } else {
        String errorMessage = "Şifre sıfırlama başarısız oldu.";
        if (response.data != null && response.data is Map && response.data.containsKey('message')) {
          errorMessage = response.data['message'];
        } else if (response.statusCode == 422 && response.data != null && response.data is Map && response.data.containsKey('errors')) {
          Map<String, dynamic> errors = response.data['errors'];
          errorMessage = errors.values.first is List ? errors.values.first.first : 'Girilen bilgilerde hata var.';
        } else {
          errorMessage = HttpStatusCodes.getMessage(response.statusCode!);
        }
        emit(PasswordResetError(message: errorMessage));
      }
    } on DioException catch (e) {
      String errorMessage = "Bir hata oluştu.";
      if (e.response != null) {
        if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
          errorMessage = e.response!.data['message'];
        } else if (e.response!.statusCode == 422 && e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('errors')) {
          Map<String, dynamic> errors = e.response!.data['errors'];
          errorMessage = errors.values.first is List ? errors.values.first.first : 'Doğrulama hatası.';
        } else {
          errorMessage = "Sunucu hatası: ${e.response!.statusCode}";
        }
      } else {
        errorMessage = 'İnternet bağlantınızı kontrol edin.';
      }
      emit(PasswordResetError(message: errorMessage));
    } catch (e) {
      emit(PasswordResetError(message: 'Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
// lib/bloc/password_reset/password_reset_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/httpStatusCodes.dart';
import '../../config/app_config.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';
part 'password_reset_bloc.freezed.dart';

class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final Dio _dio;
  final SharedPreferences _prefs;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 300; // 5 dakika

  PasswordResetBloc(this._dio, this._prefs) : super(const PasswordResetState.initial()) {
    on<SendPasswordResetCodeRequested>((event, emit) => _onSendPasswordResetCodeRequested(event, emit));
    on<ResetPasswordWithCodeRequested>((event, emit) => _onResetPasswordWithCodeRequested(event, emit));
    on<PasswordResetCooldownUpdated>((event, emit) => _onPasswordResetCooldownUpdated(event, emit));
    on<LoadPasswordResetCooldown>((event, emit) => _onLoadPasswordResetCooldown(event, emit));
  }

  void _onPasswordResetCooldownUpdated(PasswordResetCooldownUpdated event, Emitter<PasswordResetState> emit) {
    emit(PasswordResetState.cooldown(
      remainingSeconds: event.remainingSeconds,
      cooldownEmail: _prefs.getString('lastPasswordResetCodeEmail') ?? '',
    ));
  }

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
        _startCountdown(remaining, email);
        emit(PasswordResetState.cooldown(remainingSeconds: remaining, cooldownEmail: email));
      } else {
        await _prefs.remove('lastPasswordResetCodeSent');
        await _prefs.remove('lastPasswordResetCodeEmail');
        emit(const PasswordResetState.initial());
      }
    } else {
      emit(const PasswordResetState.initial());
    }
  }

  void _startCountdown(int initialSeconds, String cooldownEmail) {
    _countdownTimer?.cancel();
    int remaining = initialSeconds;

    add(PasswordResetCooldownUpdated(remainingSeconds: remaining));

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining > 0) {
        remaining--;
        add(PasswordResetCooldownUpdated(remainingSeconds: remaining));
      } else {
        _countdownTimer?.cancel();
        _prefs.remove('lastPasswordResetCodeSent');
        _prefs.remove('lastPasswordResetCodeEmail');
        emit(const PasswordResetState.initial());
      }
    });
  }

  Future<void> _onSendPasswordResetCodeRequested(
      SendPasswordResetCodeRequested event,
      Emitter<PasswordResetState> emit,
      ) async {
    emit(const PasswordResetState.loading());

    try {
      final response = await _dio.post(
        '${AppConfig.baseUrl}/send-password-reset-code',
        data: {'email': event.email},
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        await _prefs.setString('lastPasswordResetCodeSent', DateTime.now().toIso8601String());
        await _prefs.setString('lastPasswordResetCodeEmail', event.email);
        _startCountdown(_cooldownDuration, event.email);
        emit(PasswordResetState.codeSentSuccess(message: response.data['message'] ?? 'Şifre sıfırlama kodu e-posta adresinize gönderildi.', email: event.email));
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
        emit(PasswordResetState.error(message: errorMessage));
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
      emit(PasswordResetState.error(message: errorMessage));
    } catch (e) {
      emit(PasswordResetState.error(message: 'Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}'));
    }
  }

  Future<void> _onResetPasswordWithCodeRequested(
      ResetPasswordWithCodeRequested event,
      Emitter<PasswordResetState> emit,
      ) async {
    emit(const PasswordResetState.loading());

    if (event.code.isEmpty || event.newPassword.isEmpty || event.confirmPassword.isEmpty) {
      emit(const PasswordResetState.error(message: 'Lütfen tüm alanları doldurun.'));
      return;
    }
    if (event.newPassword != event.confirmPassword) {
      emit(const PasswordResetState.error(message: 'Şifreler uyuşmuyor.'));
      return;
    }
    if (event.newPassword.length < 8) {
      emit(const PasswordResetState.error(message: 'Şifre en az 8 karakter olmalı.'));
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
          headers: {'Accept': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        await _prefs.remove('lastPasswordResetCodeSent');
        await _prefs.remove('lastPasswordResetCodeEmail');
        emit(const PasswordResetState.success(message: "Şifreniz başarıyla sıfırlandı. Giriş yapabilirsiniz."));
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
        emit(PasswordResetState.error(message: errorMessage));
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
      emit(PasswordResetState.error(message: errorMessage));
    } catch (e) {
      emit(PasswordResetState.error(message: 'Beklenmedik bir hata oluştu, lütfen tekrar deneyin: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
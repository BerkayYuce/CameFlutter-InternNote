import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import '../../services/httpStatusCodes.dart';
import '../../config/app_config.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';

class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  final Dio _dio;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 60; // 1 dakika

  EmailVerificationBloc(this._dio) : super(EmailVerificationInitial()) {
    on<VerifyEmailRequested>(_onVerifyEmailRequested);
    on<ResendVerificationCodeRequested>(_onResendVerificationCodeRequested);
    on<CooldownUpdated>((event, emit) {
      emit(EmailVerificationCooldown(remainingSeconds: event.remainingSeconds));
    });
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    int remaining = _cooldownDuration;
    emit(EmailVerificationCooldown(remainingSeconds: remaining));

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining > 0) {
        remaining--;
        add(CooldownUpdated(remaining));
      } else {
        _countdownTimer?.cancel();
        emit(EmailVerificationInitial()); // Cooldown bittiğinde başlangıç durumuna dön
      }
    });
  }

  Future<void> _onVerifyEmailRequested(
      VerifyEmailRequested event,
      Emitter<EmailVerificationState> emit,
      ) async {
    emit(EmailVerificationLoading());

    if (event.code.isEmpty) {
      emit(const EmailVerificationError(message: 'Lütfen doğrulama kodunu girin.'));
      return;
    }

    try {
      final response = await _dio.post(
        '${AppConfig.baseUrl}/verify-email',
        data: {
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'password_confirmation': event.passwordConfirmation,
          'code': event.code,
          'device_name': event.deviceName,
        },
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 201) {
        emit(EmailVerificationSuccess(message: response.data['message'] ?? "E-posta başarıyla doğrulandı ve kaydınız tamamlandı."));
      } else {
        String errorMessage = "Doğrulama başarısız oldu.";
        if (response.data != null && response.data is Map && response.data.containsKey('message')) {
          errorMessage = response.data['message'];
        } else if (response.statusCode == 422 && response.data != null && response.data is Map && response.data.containsKey('errors')) {
          Map<String, dynamic> errors = response.data['errors'];
          errorMessage = errors.values.first is List ? errors.values.first.first : 'Girilen bilgilerde hata var.';
        } else {
          errorMessage = HttpStatusCodes.getMessage(response.statusCode!);
        }
        emit(EmailVerificationError(message: errorMessage));
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
      emit(EmailVerificationError(message: errorMessage));
    } catch (e) {
      emit(EmailVerificationError(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));
    }
  }

  Future<void> _onResendVerificationCodeRequested(
      ResendVerificationCodeRequested event,
      Emitter<EmailVerificationState> emit,
      ) async {
    emit(EmailVerificationLoading());

    try {
      final response = await _dio.post(
        '${AppConfig.baseUrl}/register', // Kayıt endpoint'i kodu yeniden gönderiyor
        data: {
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'password_confirmation': event.passwordConfirmation,
        },
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        emit(EmailVerificationInitial()); // Başarılı gönderim sonrası başlangıç durumuna dön (veya ayrı bir "KodYenidenGonderildi" durumu oluşturabilirsiniz)
        _startCountdown(); // Geri sayımı yeniden başlat
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
        emit(EmailVerificationError(message: errorMessage));
      }
    } on DioException catch (e) {
      String errorMessage = "Bir hata oluştu.";
      if (e.response != null) {
        if (e.response!.data != null && e.response!.data is Map && e.response!.data.containsKey('message')) {
          errorMessage = e.response!.data['message'];
        } else {
          errorMessage = "Sunucu hatası: ${e.response?.statusCode ?? 'Bilinmeyen'}";
        }
      } else {
        errorMessage = 'İnternet bağlantınızı kontrol edin.';
      }
      emit(EmailVerificationError(message: errorMessage));
    } catch (e) {
      emit(EmailVerificationError(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
// lib/bloc/email_verification/email_verification_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../services/httpStatusCodes.dart';
import '../../config/app_config.dart';

part 'email_verification_event.dart';
part 'email_verification_state.dart';
part 'email_verification_bloc.freezed.dart';

class EmailVerificationBloc extends Bloc<EmailVerificationEvent, EmailVerificationState> {

  final Dio _dio;
  Timer? _countdownTimer;
  static const int _cooldownDuration = 300; // saniye

  EmailVerificationBloc(this._dio) : super(const EmailVerificationState.initial()) {
    on<VerifyEmailRequested>((event, emit) => _onVerifyEmailRequested(event, emit));
    on<ResendVerificationCodeRequested>((event, emit) => _onResendVerificationCodeRequested(event, emit));
    on<CooldownUpdated>((event, emit) => _onCooldownUpdated(event, emit)); // Event parametreli
  }

  void _onCooldownUpdated(CooldownUpdated event, Emitter<EmailVerificationState> emit) {
    emit(EmailVerificationState.cooldown(remainingSeconds: event.remainingSeconds));
  }

  void _startCountdown() {

    _countdownTimer?.cancel();
    int remaining = _cooldownDuration;
    add(CooldownUpdated(remaining)); // CooldownUpdated event'ini add ile gönderiyoruz

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining > 0) {
        remaining--;
        add(CooldownUpdated(remaining));
      } else {
        _countdownTimer?.cancel();
        emit(const EmailVerificationState.initial());
      }
    });
  }

  Future<void> _onVerifyEmailRequested(
      VerifyEmailRequested event,
      Emitter<EmailVerificationState> emit,
      ) async {
    emit(const EmailVerificationState.loading());

    if (event.code.isEmpty) {
      emit(const EmailVerificationState.error(message: 'Lütfen doğrulama kodunu girin.'));
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
        emit(EmailVerificationState.success(message: response.data['message'] ?? "E-posta başarıyla doğrulandı ve kaydınız tamamlandı."));
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
        emit(EmailVerificationState.error(message: errorMessage));
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
      emit(EmailVerificationState.error(message: errorMessage));
    } catch (e) {
      emit(EmailVerificationState.error(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));
    }
  }

  Future<void> _onResendVerificationCodeRequested(
      ResendVerificationCodeRequested event,
      Emitter<EmailVerificationState> emit,
      ) async {
    emit(const EmailVerificationState.loading());

    try {
      final response = await _dio.post(
        '${AppConfig.baseUrl}/register', // Kayıt endpoint'i kodu yeniden gönderiyor
        data: {
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'password_confirmation': event.passwordConfirmation,
          'device_name': event.deviceName,
        },
        options: Options(
          headers: {'Accept': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        _startCountdown();
        emit(const EmailVerificationState.success(message: "Doğrulama kodu başarıyla yeniden gönderildi."));
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
        emit(EmailVerificationState.error(message: errorMessage));
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
      emit(EmailVerificationState.error(message: errorMessage));
    } catch (e) {
      emit(EmailVerificationState.error(message: 'Beklenmedik bir hata oluştu: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
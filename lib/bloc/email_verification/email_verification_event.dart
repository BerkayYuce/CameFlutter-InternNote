// lib/bloc/email_verification/email_verification_event.dart
part of 'email_verification_bloc.dart';

@freezed
abstract class EmailVerificationEvent with _$EmailVerificationEvent {
  const factory EmailVerificationEvent.verifyEmailRequested({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String code,
    required String deviceName, // Cihaz adı eklendi
  }) = VerifyEmailRequested; // '_' kaldırıldı

  const factory EmailVerificationEvent.resendVerificationCodeRequested({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String deviceName, // Cihaz adı burada da gerekli olabilir
  }) = ResendVerificationCodeRequested; // '_' kaldırıldı

  const factory EmailVerificationEvent.cooldownUpdated(int remainingSeconds) = CooldownUpdated; // '_' kaldırıldı
}
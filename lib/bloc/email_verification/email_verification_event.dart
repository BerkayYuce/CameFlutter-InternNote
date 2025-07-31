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
    required String deviceName,
  }) = VerifyEmailRequested;

  const factory EmailVerificationEvent.resendVerificationCodeRequested({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String deviceName,
  }) = ResendVerificationCodeRequested;

  const factory EmailVerificationEvent.cooldownUpdated(int remainingSeconds) = CooldownUpdated;
}
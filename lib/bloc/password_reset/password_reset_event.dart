// lib/bloc/password_reset/password_reset_event.dart
part of 'password_reset_bloc.dart';

@freezed
abstract class PasswordResetEvent with _$PasswordResetEvent {
  const factory PasswordResetEvent.sendPasswordResetCodeRequested({
    required String email,
  }) = SendPasswordResetCodeRequested; // '_' kaldırıldı

  const factory PasswordResetEvent.resetPasswordWithCodeRequested({
    required String email,
    required String code,
    required String newPassword,
    required String confirmPassword,
  }) = ResetPasswordWithCodeRequested; // '_' kaldırıldı

  const factory PasswordResetEvent.passwordResetCooldownUpdated({
    required int remainingSeconds,
  }) = PasswordResetCooldownUpdated; // '_' kaldırıldı

  const factory PasswordResetEvent.loadPasswordResetCooldown() = LoadPasswordResetCooldown; // '_' kaldırıldı
}
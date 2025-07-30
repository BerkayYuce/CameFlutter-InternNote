// lib/bloc/password_reset/password_reset_state.dart
part of 'password_reset_bloc.dart';

@freezed
abstract class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState.initial() = Initial; // '_' kaldırıldı
  const factory PasswordResetState.loading() = Loading; // '_' kaldırıldı
  const factory PasswordResetState.codeSentSuccess({
    required String message,
    required String email,
  }) = CodeSentSuccess; // '_' kaldırıldı
  const factory PasswordResetState.success({
    required String message,
  }) = Success; // '_' kaldırıldı
  const factory PasswordResetState.error({
    required String message,
  }) = Error; // '_' kaldırıldı
  const factory PasswordResetState.cooldown({
    required int remainingSeconds,
    required String cooldownEmail,
  }) = Cooldown; // '_' kaldırıldı
}
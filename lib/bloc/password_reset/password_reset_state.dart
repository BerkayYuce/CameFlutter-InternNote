// lib/bloc/password_reset/password_reset_state.dart
part of 'password_reset_bloc.dart';

@freezed
abstract class PasswordResetState with _$PasswordResetState {

  const factory PasswordResetState.initial() = Initial;
  const factory PasswordResetState.loading() = Loading;

  const factory PasswordResetState.codeSentSuccess({
    required String message,
    required String email,
  }) = CodeSentSuccess;


  const factory PasswordResetState.success({
    required String message,
  }) = Success;


  const factory PasswordResetState.error({
    required String message,
  }) = Error;


  const factory PasswordResetState.cooldown({
    required int remainingSeconds,
    required String cooldownEmail,
  }) = Cooldown;
}
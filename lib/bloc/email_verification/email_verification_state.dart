// lib/bloc/email_verification/email_verification_state.dart
part of 'email_verification_bloc.dart';

@freezed
abstract class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState.initial() = Initial;
  const factory EmailVerificationState.loading() = Loading;
  const factory EmailVerificationState.success({required String message}) = Success;
  const factory EmailVerificationState.error({required String message}) = Error;
  const factory EmailVerificationState.cooldown({required int remainingSeconds}) = Cooldown;
}
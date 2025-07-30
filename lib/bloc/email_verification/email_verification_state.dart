// lib/bloc/email_verification/email_verification_state.dart
part of 'email_verification_bloc.dart';

@freezed
abstract class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState.initial() = Initial; // '_' kaldırıldı
  const factory EmailVerificationState.loading() = Loading; // '_' kaldırıldı
  const factory EmailVerificationState.success({required String message}) = Success; // '_' kaldırıldı
  const factory EmailVerificationState.error({required String message}) = Error; // '_' kaldırıldı
  const factory EmailVerificationState.cooldown({required int remainingSeconds}) = Cooldown; // '_' kaldırıldı, message kaldırıldı
}
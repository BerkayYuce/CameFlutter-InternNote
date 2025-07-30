// lib/bloc/auth/auth_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart'; // @immutable için

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
    required String deviceName,
    required bool rememberMe,
  }) = LoginRequested;

  const factory AuthEvent.registerRequested({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String deviceName, // register event'e eklendi
  }) = RegisterRequested;

  const factory AuthEvent.autoLoginRequested({
    required String rememberToken,
    required String deviceName,
  }) = AutoLoginRequested;

  const factory AuthEvent.logoutRequested() = LogoutRequested;

// E-posta doğrulama event'leri AuthBloc'tan kaldırıldı.
// const factory AuthEvent.sendVerificationEmail({
//   required String email,
//   String? name,
//   String? password,
//   String? passwordConfirmation,
// }) = SendVerificationEmail;

// const factory AuthEvent.verifyEmail({
//   required String email,
//   required String verificationCode,
//   String? name,
//   String? password,
//   String? passwordConfirmation,
// }) = VerifyEmail;
}
// lib/bloc/auth/auth_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {


  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;


  // Başarılı giriş/kayıt/otomatik giriş durumu
  const factory AuthState.success({
    required String message,
    String? authToken,
    String? rememberMeToken,
    Map<String, dynamic>? user, // Kullanıcı bilgilerini de taşıyacak
  }) = AuthSuccess;


  // Hata durumu
  const factory AuthState.error({
    required String message,
  }) = AuthError;



  const factory AuthState.emailVerificationRequired({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String message,
  }) = AuthEmailVerificationRequired;
}
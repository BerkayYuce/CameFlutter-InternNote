part of 'password_reset_bloc.dart';

abstract class PasswordResetState extends Equatable {
  const PasswordResetState();

  @override
  List<Object> get props => [];
}

// Başlangıç durumu
class PasswordResetInitial extends PasswordResetState {}

// Yükleme durumu
class PasswordResetLoading extends PasswordResetState {}

// Şifre sıfırlama kodu başarıyla gönderildi
class PasswordResetCodeSentSuccess extends PasswordResetState {
  final String message;
  final String email; // Hangi e-posta için kod gönderildiğini sakla

  const PasswordResetCodeSentSuccess({required this.message, required this.email});

  @override
  List<Object> get props => [message, email];
}

// Şifre başarıyla sıfırlandı
class PasswordResetSuccess extends PasswordResetState {
  final String message;

  const PasswordResetSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

// Hata durumu
class PasswordResetError extends PasswordResetState {
  final String message;

  const PasswordResetError({required this.message});

  @override
  List<Object> get props => [message];
}

// Cooldown durumu (geri sayım aktif)
class PasswordResetCooldownState extends PasswordResetState {
  final int remainingSeconds;
  final String cooldownEmail; // Cooldown hangi e-posta için aktif

  const PasswordResetCooldownState({required this.remainingSeconds, required this.cooldownEmail});

  @override
  List<Object> get props => [remainingSeconds, cooldownEmail];
}
part of 'password_reset_bloc.dart';

abstract class PasswordResetEvent extends Equatable {
  const PasswordResetEvent();

  @override
  List<Object> get props => [];
}

// Şifre sıfırlama kodu gönderme isteği
class SendPasswordResetCodeRequested extends PasswordResetEvent {
  final String email;

  const SendPasswordResetCodeRequested({required this.email});

  @override
  List<Object> get props => [email];
}

// Şifreyi kod ile sıfırlama isteği
class ResetPasswordWithCodeRequested extends PasswordResetEvent {
  final String email;
  final String code;
  final String newPassword;
  final String confirmPassword;

  const ResetPasswordWithCodeRequested({
    required this.email,
    required this.code,
    required this.newPassword,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, code, newPassword, confirmPassword];
}

// Geri sayım süresinin güncellenmesi
class PasswordResetCooldownUpdated extends PasswordResetEvent {
  final int remainingSeconds;

  const PasswordResetCooldownUpdated(this.remainingSeconds);

  @override
  List<Object> get props => [remainingSeconds];
}

// Cooldown durumunun Shared Preferences'tan yüklenmesi
class LoadPasswordResetCooldown extends PasswordResetEvent {}
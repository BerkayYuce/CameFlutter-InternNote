part of 'email_verification_bloc.dart';

abstract class EmailVerificationEvent extends Equatable {
  const EmailVerificationEvent();

  @override
  List<Object> get props => [];
}

class VerifyEmailRequested extends EmailVerificationEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String code;
  final String deviceName;

  const VerifyEmailRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.code,
    required this.deviceName,
  });

  @override
  List<Object> get props => [name, email, password, passwordConfirmation, code, deviceName];
}

class ResendVerificationCodeRequested extends EmailVerificationEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  const ResendVerificationCodeRequested({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object> get props => [name, email, password, passwordConfirmation];
}

class CooldownUpdated extends EmailVerificationEvent {
  final int remainingSeconds;

  const CooldownUpdated(this.remainingSeconds);

  @override
  List<Object> get props => [remainingSeconds];
}
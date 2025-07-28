part of 'email_verification_bloc.dart';

abstract class EmailVerificationState extends Equatable {
  const EmailVerificationState();

  @override
  List<Object> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {
  final String message;

  const EmailVerificationSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class EmailVerificationError extends EmailVerificationState {
  final String message;

  const EmailVerificationError({required this.message});

  @override
  List<Object> get props => [message];
}

class EmailVerificationCooldown extends EmailVerificationState {
  final int remainingSeconds;
  final String message;

  const EmailVerificationCooldown({required this.remainingSeconds, this.message = ''});

  @override
  List<Object> get props => [remainingSeconds, message];
}
part of 'authantication_cubit.dart';

abstract class AuthanticationState extends Equatable {
  const AuthanticationState();

  @override
  List<Object> get props => [];
}

class AuthanticationInitial extends AuthanticationState {}

class AuthModeChanged extends AuthanticationState {
  final bool isLogin;
  const AuthModeChanged(this.isLogin);

  @override
  List<Object> get props => [isLogin];
}

class CountryCodeChanged extends AuthanticationState {
  final String countryCode;
  const CountryCodeChanged(this.countryCode);

  @override
  List<Object> get props => [countryCode];
}

class OtpTimerUpdated extends AuthanticationState {
  final double secondsRemaining;
  const OtpTimerUpdated(this.secondsRemaining);

  @override
  List<Object> get props => [secondsRemaining];
}

class AuthLoading extends AuthanticationState {}

class AuthSuccess extends AuthanticationState {
  final String message;
  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class AuthError extends AuthanticationState {
  final String error;
  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}
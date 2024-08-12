part of 'auth_token_bloc.dart';

sealed class AuthTokenEvent extends Equatable {
  const AuthTokenEvent();
}

class AuthTokenValidDetected extends AuthTokenEvent {
  const AuthTokenValidDetected();

  @override
  List<Object?> get props => [];
}

class AuthTokenInValidDetected extends AuthTokenEvent {
  const AuthTokenInValidDetected();

  @override
  List<Object?> get props => [];
}

class AuthTokenTestAvailability extends AuthTokenEvent {
  const AuthTokenTestAvailability();

  @override
  List<Object?> get props => [];
}

part of 'auth_token_bloc.dart';

sealed class AuthTokenState extends Equatable {
  const AuthTokenState();
}

final class AuthTokenInitial extends AuthTokenState {
  @override
  List<Object> get props => [];
}

final class AuthTokenValid extends AuthTokenState {
  @override
  List<Object> get props => [];
}

final class AuthTokenInvalid extends AuthTokenState {
  const AuthTokenInvalid({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class AuthTokenValidityIsTested extends AuthTokenState {
  @override
  List<Object> get props => [];
}

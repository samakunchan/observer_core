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
  @override
  List<Object> get props => [];
}

final class AuthTokenValidityIsTested extends AuthTokenState {
  @override
  List<Object> get props => [];
}

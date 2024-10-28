import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_token_event.dart';
part 'auth_token_state.dart';

class AuthTokenBloc extends Bloc<AuthTokenEvent, AuthTokenState> {
  AuthTokenBloc() : super(AuthTokenInitial()) {
    on<AuthTokenValidDetected>(_onValidToken);
    on<AuthTokenInValidDetected>(_onInValidToken);
  }

  FutureOr<void> _onValidToken(AuthTokenValidDetected event, Emitter<AuthTokenState> emit) async {
    emit.call(AuthTokenValid());
  }

  FutureOr<void> _onInValidToken(AuthTokenInValidDetected event, Emitter<AuthTokenState> emit) async {
    emit.call(AuthTokenInvalid(message: event.message));
  }
}

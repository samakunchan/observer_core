import 'package:equatable/equatable.dart';
import 'package:observer_core/constantes.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure({this.message = ErrorMessage.serverFailureMessage});
  final String message;

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  CacheFailure({this.message = ErrorMessage.cacheFailureMessage});
  final String message;

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  NetworkFailure({this.message = ErrorMessage.networkOfflineMessage});
  final String message;

  @override
  List<Object> get props => [message];
}

class NotFoundFailure extends Failure {
  NotFoundFailure({this.message = ErrorMessage.notFoundMessage});
  final String message;

  @override
  List<Object> get props => [message];
}

class UnAuthorizedFailure extends Failure {
  UnAuthorizedFailure({this.message = ErrorMessage.unAuthorizationMessage});
  final String message;

  @override
  List<Object> get props => [message];
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure({this.message = ErrorMessage.forbiddenMessage});
  final String message;

  @override
  List<Object> get props => [message];
}

class BadRequestFailure extends Failure {
  BadRequestFailure({this.message = ''});
  final String message;

  @override
  List<Object> get props => [message];
}

class IDontKnowWhatImDoingFailure extends Failure {}

class NothingWorkDoingFailure extends Failure {}

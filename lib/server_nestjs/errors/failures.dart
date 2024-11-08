import 'package:equatable/equatable.dart';
import 'package:observer_core/constantes.dart';

abstract class Failure extends Equatable {
  const Failure({this.message = ErrorMessage.noErrorMessageHandled});
  final String message;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = ErrorMessage.serverFailureMessage});
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = ErrorMessage.cacheFailureMessage});

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = ErrorMessage.networkOfflineMessage});

  @override
  List<Object> get props => [message];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = ErrorMessage.notFoundMessage});

  @override
  List<Object> get props => [message];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure({super.message = ErrorMessage.unAuthorizationMessage});

  @override
  List<Object> get props => [message];
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.message = ErrorMessage.forbiddenMessage});

  @override
  List<Object> get props => [message];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message = ''});

  @override
  List<Object> get props => [message];
}

class IDontKnowWhatImDoingFailure extends Failure {
  @override
  List<Object> get props => [message];
}

class NothingWorkDoingFailure extends Failure {
  @override
  List<Object> get props => [message];
}

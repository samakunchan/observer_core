part of 'environment_datas_bloc.dart';

abstract class EnvironmentDatasEvent extends Equatable {
  const EnvironmentDatasEvent();
}

class EnvironmentsDatasInMemoryTriggered extends EnvironmentDatasEvent {
  const EnvironmentsDatasInMemoryTriggered({this.environments = EnvironmentModel.emptyList});

  final List<EnvironmentModel> environments;

  @override
  List<Object?> get props => [environments];
}

class EnvironmentsDatasTriggered extends EnvironmentDatasEvent {
  const EnvironmentsDatasTriggered({this.environments = EnvironmentModel.emptyList});

  final List<EnvironmentModel> environments;

  @override
  List<Object?> get props => [environments];
}

class EnvironmentsErrorsTriggered extends EnvironmentDatasEvent {
  const EnvironmentsErrorsTriggered({this.message = ErrorMessage.noErrorMessageHandled});

  /// Tout les messages d'érreurs:
  /// - [ErrorMessage.noErrorMessageHandled]
  /// - [ErrorMessage.networkOfflineMessage]
  /// - [ErrorMessage.serverFailureMessage]
  /// - [ErrorMessage.cacheFailureMessage]
  /// - [ErrorMessage.notFoundMessage]
  /// - [ErrorMessage.unAuthorizationMessage]
  /// - [ErrorMessage.forbiddenMessage]
  final String message;

  @override
  List<Object?> get props => [message];
}

class EnvironmentsDatasSelected extends EnvironmentDatasEvent {
  const EnvironmentsDatasSelected({
    required this.environments,
    required this.filterId,
    this.filteredEnvironments = EnvironmentModel.emptyList,
  });
  final List<EnvironmentModel> filteredEnvironments;
  final List<EnvironmentModel> environments;
  final int filterId;

  @override
  List<Object?> get props => [environments, filterId];
}

class EnvironmentsDatasSubmitted extends EnvironmentDatasEvent {
  const EnvironmentsDatasSubmitted({required this.environmentForUpsert});
  final EnvironmentUpsertDto environmentForUpsert;

  @override
  List<Object?> get props => [environmentForUpsert];
}

class EnvironmentsDatasDeleted extends EnvironmentDatasEvent {
  const EnvironmentsDatasDeleted({required this.environmentForDelete});
  final EnvironmentModel environmentForDelete;

  @override
  List<Object?> get props => [environmentForDelete];
}

part of 'environment_datas_bloc.dart';

abstract class EnvironmentDatasEvent extends Equatable {
  const EnvironmentDatasEvent();
}

class EnvironmentDatasRequested extends EnvironmentDatasEvent {
  const EnvironmentDatasRequested({this.environments = EnvironmentModel.emptyList});

  final List<EnvironmentModel> environments;

  @override
  List<Object?> get props => [environments];
}

class EnvironmentDatasInMemoryRequested extends EnvironmentDatasEvent {
  const EnvironmentDatasInMemoryRequested({this.environments = EnvironmentModel.emptyList});

  final List<EnvironmentModel> environments;

  @override
  List<Object?> get props => [environments];
}

class EnvironmentDatasErrorsRequested extends EnvironmentDatasEvent {
  const EnvironmentDatasErrorsRequested({this.message = ErrorMessage.noErrorMessageHandled});

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

class EnvironmentDatasSelected extends EnvironmentDatasEvent {
  const EnvironmentDatasSelected({
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

class EnvironmentDatasSubmitted extends EnvironmentDatasEvent {
  const EnvironmentDatasSubmitted({required this.environmentForUpsert});
  final EnvironmentUpsertDTO environmentForUpsert;

  @override
  List<Object?> get props => [environmentForUpsert];
}

class EnvironmentDatasDeleted extends EnvironmentDatasEvent {
  const EnvironmentDatasDeleted({required this.environmentForDelete});
  final EnvironmentDeleteDTO environmentForDelete;

  @override
  List<Object?> get props => [environmentForDelete];
}

// class EnvironmentDatasOnSearch extends EnvironmentDatasEvent {
//   const EnvironmentDatasOnSearch({required this.input, this.strictMode = false});
//   final String input;
//   final bool strictMode;
//
//   @override
//   List<Object?> get props => [input];
// }

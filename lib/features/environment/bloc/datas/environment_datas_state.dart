part of 'environment_datas_bloc.dart';

abstract class EnvironmentDatasState extends Equatable {
  const EnvironmentDatasState();
}

class EnvironmentDatasIsSuccessfullyLoaded extends EnvironmentDatasState {
  const EnvironmentDatasIsSuccessfullyLoaded({
    required this.selectedId,
    this.environments = EnvironmentModel.emptyList,
    this.filteredEnvironments = EnvironmentModel.emptyList,
  });

  final List<EnvironmentModel> environments;
  final List<EnvironmentModel> filteredEnvironments;

  /// Le selectedId est de valeur 1 et à été ajouter à la main.
  /// Avant je devais faire la différenciation entre les articles et projets (construit de manière identiques)
  /// Ce n'est plus le cas aujourd'hui (pour le moment). Il n'est pas à exclure de construire une autre page de la même manière.
  final int selectedId;

  @override
  List<Object> get props => [environments, filteredEnvironments];
}

class EnvironmentDatasIsSuccessfullyLoadedInMemory extends EnvironmentDatasState {
  const EnvironmentDatasIsSuccessfullyLoadedInMemory({
    required this.selectedId,
    this.environments = EnvironmentModel.emptyList,
    this.filteredEnvironments = EnvironmentModel.emptyList,
  });

  final List<EnvironmentModel> environments;
  final List<EnvironmentModel> filteredEnvironments;
  final int selectedId;

  @override
  List<Object> get props => [environments, filteredEnvironments];
}

class EnvironmentDatasHasFailure extends EnvironmentDatasState {
  const EnvironmentDatasHasFailure({this.message = ErrorMessage.noErrorMessageHandled});

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

class EnvironmentDatasIsSubmitting extends EnvironmentDatasState {
  @override
  List<Object> get props => [];
}

class EnvironmentDatasFormIsSubmittedSuccessfully extends EnvironmentDatasState {
  const EnvironmentDatasFormIsSubmittedSuccessfully({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

class EnvironmentDatasIsDeletedSuccessfully extends EnvironmentDatasState {
  @override
  List<Object> get props => [];
}

// class EnvironmentDatasIsSearchSuccessfully extends EnvironmentDatasState {
//   const EnvironmentDatasIsSearchSuccessfully({required this.searchModel});
//
//   final SearchModel searchModel;
//
//   @override
//   List<Object> get props => [searchModel];
// }

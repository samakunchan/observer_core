part of 'environment_datas_bloc.dart';

abstract class EnvironmentDatasState extends Equatable {
  const EnvironmentDatasState();
}

class EnvironmentDatasIsSusscessfullyLoaded extends EnvironmentDatasState {
  const EnvironmentDatasIsSusscessfullyLoaded({
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

class EnvironmentDatasIsSusscessfullyLoadedInMemory extends EnvironmentDatasState {
  const EnvironmentDatasIsSusscessfullyLoadedInMemory({
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

class EnvironmentsDatasIsSubmitting extends EnvironmentDatasState {
  @override
  List<Object> get props => [];
}

class EnvironmentsDatasFormIsSubmittedSuccessfully extends EnvironmentDatasState {
  const EnvironmentsDatasFormIsSubmittedSuccessfully({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

class EnvironmentsDatasIsDeletedSuccessfully extends EnvironmentDatasState {
  @override
  List<Object> get props => [];
}

part of 'environment_store_bloc.dart';

abstract class EnvironmentStoreState extends Equatable {
  const EnvironmentStoreState();
}

class EnvironmentStoreInitial extends EnvironmentStoreState {
  @override
  List<Object> get props => [];
}

class EnvironmentStoreIsLoading extends EnvironmentStoreState {
  @override
  List<Object> get props => [];
}

class EnvironmentsStoreIsOpen extends EnvironmentStoreState {
  const EnvironmentsStoreIsOpen({
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

class EnvironmentsStoreIsOpenInMemory extends EnvironmentStoreState {
  const EnvironmentsStoreIsOpenInMemory({
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

class EnvironmentsStoreIsClosed extends EnvironmentStoreState {
  const EnvironmentsStoreIsClosed({this.message = ErrorMessage.noErrorMessageHandled});

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
  List<Object> get props => [message];
}

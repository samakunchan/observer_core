part of 'proposed_services_bloc.dart';

abstract class ProposedServicesState extends Equatable {
  const ProposedServicesState();
}

final class ProposedServicesInitial extends ProposedServicesState {
  @override
  List<Object> get props => [];
}

final class ProposedServicesAreLoading extends ProposedServicesState {
  @override
  List<Object> get props => [];
}

final class ProposedServicesAreLoadedSuccessfully extends ProposedServicesState {
  const ProposedServicesAreLoadedSuccessfully({required this.services});

  final List<ProposedServiceModel> services;

  @override
  List<Object> get props => [services];
}

final class ProposedServiceIsSubmitting extends ProposedServicesState {
  @override
  List<Object> get props => [];
}

final class ProposedServiceIsSubmittingSuccessfully extends ProposedServicesState {
  @override
  List<Object> get props => [];
}

final class ProposedServiceIsRemovedSuccessfully extends ProposedServicesState {
  @override
  List<Object> get props => [];
}

final class ProposedServicesHaveFailure extends ProposedServicesState {
  const ProposedServicesHaveFailure({this.message = ErrorMessage.noErrorMessageHandled});

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

final class ProposedServiceReloaded extends ProposedServicesState {
  @override
  List<Object> get props => [];
}

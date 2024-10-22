part of 'reason_bloc.dart';

abstract class ReasonState extends Equatable {
  const ReasonState();
}

final class ReasonInitial extends ReasonState {
  @override
  List<Object> get props => [];
}

final class ReasonsAreLoading extends ReasonState {
  @override
  List<Object> get props => [];
}

final class ReasonsAreLoadedSuccessfully extends ReasonState {
  const ReasonsAreLoadedSuccessfully({required this.reasons});

  final List<ReasonModel> reasons;

  @override
  List<Object> get props => [reasons];
}

final class ReasonIsSubmitting extends ReasonState {
  @override
  List<Object> get props => [];
}

final class ReasonIsSubmittingSuccessfully extends ReasonState {
  const ReasonIsSubmittingSuccessfully({required this.reason, this.status = UpsertFormType.create});

  final ReasonModel reason;
  final UpsertFormType status;

  @override
  List<Object> get props => [reason, status];
}

final class ReasonIsRemovedSuccessfully extends ReasonState {
  @override
  List<Object> get props => [];
}

final class ReasonsHaveFailure extends ReasonState {
  const ReasonsHaveFailure({this.message = ErrorMessage.noErrorMessageHandled});

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

final class ReasonReloaded extends ReasonState {
  @override
  List<Object> get props => [];
}

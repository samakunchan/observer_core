part of 'skill_bloc.dart';

sealed class SkillState extends Equatable {
  const SkillState();
}

final class SkillInitial extends SkillState {
  @override
  List<Object> get props => [];
}

final class SkillsAreLoading extends SkillState {
  @override
  List<Object> get props => [];
}

final class SkillsAreLoadedSuccessfully extends SkillState {
  const SkillsAreLoadedSuccessfully({required this.skills});

  final List<SkillModel> skills;

  @override
  List<Object> get props => [skills];
}

final class SkillIsSubmitting extends SkillState {
  @override
  List<Object> get props => [];
}

final class SkillIsSubmittingSuccessfully extends SkillState {
  const SkillIsSubmittingSuccessfully({required this.skill, this.status = UpsertFormType.create});

  final SkillModel skill;
  final UpsertFormType status;

  @override
  List<Object> get props => [skill, status];
}

final class SkillIsRemovedSuccessfully extends SkillState {
  @override
  List<Object> get props => [];
}

final class SkillsHaveFailure extends SkillState {
  const SkillsHaveFailure({this.message = ErrorMessage.noErrorMessageHandled});

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

final class SkillReloaded extends SkillState {
  @override
  List<Object> get props => [];
}

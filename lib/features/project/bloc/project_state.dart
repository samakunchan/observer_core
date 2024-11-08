part of 'project_bloc.dart';

abstract class ProjectState extends Equatable {
  const ProjectState();
}

final class ProjectInitial extends ProjectState {
  @override
  List<Object> get props => [];
}

class ProjectIsLoading extends ProjectState {
  @override
  List<Object> get props => [];
}

class ProjectsShowOnGridMode extends ProjectState {
  const ProjectsShowOnGridMode({this.projects = ProjectModel.emptyList});

  final List<ProjectModel> projects;
  @override
  List<Object> get props => [projects];
}

class ProjectsShowOnListMode extends ProjectState {
  const ProjectsShowOnListMode({this.projects = ProjectModel.emptyList});

  final List<ProjectModel> projects;
  @override
  List<Object> get props => [projects];
}

class ProjectIsRemovedSuccessfully extends ProjectState {
  @override
  List<Object> get props => [];
}

class ProjectFormIsSubmittedSuccessfully extends ProjectState {
  @override
  List<Object> get props => [];
}

class ProjectHasFailure extends ProjectState {
  const ProjectHasFailure({this.message = ErrorMessage.noErrorMessageHandled});

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

class ProjectItemIsEditable extends ProjectState {
  @override
  List<Object> get props => [];
}

class ProjectItemIsNotEditable extends ProjectState {
  @override
  List<Object> get props => [];
}

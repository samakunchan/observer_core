part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();
}

class ProjectsInGridModeTriggered extends ProjectEvent {
  const ProjectsInGridModeTriggered({this.projects = ProjectModel.emptyList});

  final List<ProjectModel> projects;
  @override
  List<Object?> get props => [projects];
}

class ProjectsInListModeTriggered extends ProjectEvent {
  const ProjectsInListModeTriggered({this.projects = ProjectModel.emptyList});

  final List<ProjectModel> projects;
  @override
  List<Object?> get props => [projects];
}

class ProjectSubmitted extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class ProjectDeleted extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class ProjectsFiltered extends ProjectEvent {
  const ProjectsFiltered({this.projects = ProjectModel.emptyList});

  final List<ProjectModel> projects;
  @override
  List<Object?> get props => [projects];
}

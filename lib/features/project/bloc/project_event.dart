part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
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
  const ProjectSubmitted({required this.projectDTOForUpsert});
  final ProjectDTO projectDTOForUpsert;

  @override
  List<Object?> get props => [projectDTOForUpsert];
}

class ProjectDeleted extends ProjectEvent {
  const ProjectDeleted({required this.id});

  final int id;
  @override
  List<Object?> get props => [id];
}

class ProjectsFiltered extends ProjectEvent {
  const ProjectsFiltered({this.projects = ProjectModel.emptyList});

  final List<ProjectModel> projects;
  @override
  List<Object?> get props => [projects];
}

class ProjectInProgress extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class ProjectFormReset extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class ProjectReloaded extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class ProjectItemEditableActived extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

class ProjectItemEditableCanceled extends ProjectEvent {
  @override
  List<Object?> get props => [];
}

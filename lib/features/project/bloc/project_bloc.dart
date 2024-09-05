import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/authentication/authentication_feature.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/dio.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<ProjectsInGridModeTriggered>(_showProjectsInGridMode);
    on<ProjectsInListModeTriggered>(_showProjectsInListMode);
    on<ProjectsFiltered>(_filterProjects);
    on<ProjectDeleted>(_deleteProject);
  }

  Future<void> _showProjectsInGridMode(ProjectsInGridModeTriggered event, Emitter<ProjectState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
    );

    switch (responses) {
      case Left():
        responses.fold((Failure failure) => _handleAllFailures(failure: failure, emit: emit), (HttpResponse<dynamic> response) => null);
      case Right():
        responses.fold((Failure failure) => null, (HttpResponse<dynamic> response) {
          final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
          final List<ProjectModel> projects = datasJson.map<ProjectModel>(ProjectModel.fromJson).toList();
          emit.call(ProjectsShowOnGridMode(projects: projects));
        });
      default:
        emit.call(ProjectIsLoading());
    }
  }

  Future<void> _showProjectsInListMode(ProjectsInListModeTriggered event, Emitter<ProjectState> emit) async {
    emit.call(ProjectsShowOnListMode(projects: event.projects));
  }

  Future<void> _deleteProject(ProjectDeleted event, Emitter<ProjectState> emit) async {
    emit.call(ProjectIsRemovedSuccessfully());
  }

  Future<void> _filterProjects(ProjectsFiltered event, Emitter<ProjectState> emit) async {
    emit.call(ProjectsShowOnListMode(projects: event.projects));
  }

  void _handleAllFailures({required Failure failure, required Emitter<ProjectState> emit}) {
    switch (failure) {
      case ServerFailure():
        return emit.call(ProjectsAreNotLoaded(message: failure.message));
      case CacheFailure():
        return emit.call(ProjectsAreNotLoaded(message: failure.message));
      case NetworkFailure():
        return emit.call(ProjectsAreNotLoaded(message: failure.message));
      case NotFoundFailure():
        return emit.call(ProjectsAreNotLoaded(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(ProjectsAreNotLoaded(message: failure.message));
      case ForbiddenFailure():
        return emit.call(ProjectsAreNotLoaded(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const ProjectsAreNotLoaded());
      default:
        return emit.call(ProjectIsLoading());
    }
  }
}

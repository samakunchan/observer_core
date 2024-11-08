import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/dio.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<ProjectFormReset>(_resetProjectForm);
    on<ProjectSubmitted>(_upsertProject);
    on<ProjectsInGridModeTriggered>(_showProjectsInGridMode);
    on<ProjectsInListModeTriggered>(_showProjectsInListMode);
    on<ProjectsFiltered>(_filterProjects);
    on<ProjectDeleted>(_deleteProject);
    on<ProjectReloaded>(_reloadProjects);
    on<ProjectItemEditableActivated>(_activeEditableItem);
    on<ProjectItemEditableCanceled>(_cancelEditableItem);
  }

  Future<void> _resetProjectForm(ProjectFormReset event, Emitter<ProjectState> emit) async {
    emit(ProjectInitial());
  }

  Future<void> _showProjectsInGridMode(ProjectsInGridModeTriggered event, Emitter<ProjectState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
    );
    const ProjectHandler projectHandler = ProjectHandler();
    switch (responses) {
      case Left():
        await projectHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        final List<Map<String, dynamic>> datasJson = (responses.value.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
        final List<ProjectModel> projects = datasJson.map<ProjectModel>(ProjectModel.fromJson).toList();
        emit.call(ProjectsShowOnGridMode(projects: projects));
    }
  }

  Future<void> _showProjectsInListMode(ProjectsInListModeTriggered event, Emitter<ProjectState> emit) async {
    emit.call(ProjectsShowOnListMode(projects: event.projects));
  }

  Future<void> _deleteProject(ProjectDeleted event, Emitter<ProjectState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        body: event.id.toString(),
        endPoint: MainProject.projectsEndPoint,
      ),
    );
    const ProjectHandler projectHandler = ProjectHandler();
    switch (responses) {
      case Left():
        await projectHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await ProjectHandler.handleDeleteSuccess(response: responses.value, emit: emit);
    }
  }

  Future<void> _filterProjects(ProjectsFiltered event, Emitter<ProjectState> emit) async {
    emit.call(ProjectsShowOnListMode(projects: event.projects));
  }

  Future<void> _reloadProjects(ProjectReloaded event, Emitter<ProjectState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        endPoint: MainProject.categoriesEndPoint,
        accessToken: authTokenModel.accessToken,
      ),
    );

    const ProjectHandler projectHandler = ProjectHandler();
    switch (responses) {
      case Left():
        await projectHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        final List<Map<String, dynamic>> datasJson = (responses.value.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
        final List<ProjectModel> projects = datasJson.map<ProjectModel>(ProjectModel.fromJson).toList();
        emit.call(ProjectsShowOnGridMode(projects: projects));
    }
  }

  Future<void> _upsertProject(ProjectSubmitted event, Emitter<ProjectState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.projectsEndPoint,
        body: jsonEncode(event.projectDTOForUpsert.toJson()),
      ),
    );

    const ProjectHandler projectHandler = ProjectHandler();
    switch (responses) {
      case Left():
        await projectHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await ProjectHandler.handleUpsertSuccess(response: responses.value, emit: emit);
    }
  }

  Future<void> _activeEditableItem(ProjectItemEditableActivated event, Emitter<ProjectState> emit) async {
    emit.call(ProjectItemIsEditable());
  }

  Future<void> _cancelEditableItem(ProjectItemEditableCanceled event, Emitter<ProjectState> emit) async {
    emit.call(ProjectItemIsNotEditable());
  }
}

class ProjectHandler {
  const ProjectHandler();

  Future<void> handleAllFailures({required Failure failure, required Emitter<ProjectState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case CacheFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case BadRequestFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case NetworkFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case NotFoundFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case ForbiddenFailure():
        return emit.call(ProjectHasFailure(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const ProjectHasFailure());
      default:
        return emit.call(ProjectIsLoading());
    }
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProjectState> emit,
  }) async {
    emit.call(ProjectFormIsSubmittedSuccessfully());
  }

  // static Future<void> storeProjects({required List<ProjectModel> projects}) async {
  //   final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
  //   await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
  //     UpsertParams(
  //       endPoint: MainProject.projectsEndPoint,
  //       accessToken: authTokenModel.accessToken,
  //       body: jsonEncode(projects),
  //     ),
  //   );
  // }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProjectState> emit,
  }) async {
    emit.call(ProjectIsRemovedSuccessfully());
  }

  // static Future<void> handleSearchSuccess({
  //   required HttpResponse<dynamic> response,
  //   required Emitter<ProjectState> emit,
  // }) async {
  //   debugPrint(response.data.toString());
  //   // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  // }
}

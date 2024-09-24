import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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
    on<ProjectItemEditableActived>(_activeEditableItem);
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
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        body: event.id.toString(),
        endPoint: MainProject.projectsEndPoint,
      ),
    );

    await ProjectHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => ProjectHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ProjectHandler.handleDeleteSuccess(response: response, emit: emit),
    );
  }

  Future<void> _filterProjects(ProjectsFiltered event, Emitter<ProjectState> emit) async {
    emit.call(ProjectsShowOnListMode(projects: event.projects));
  }

  Future<void> _reloadProjects(ProjectReloaded event, Emitter<ProjectState> emit) async {
    // final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    // final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
    //   GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
    // );
    //
    // switch (responses) {
    //   case Left():
    //     responses.fold((Failure failure) => _handleAllFailures(failure: failure, emit: emit), (HttpResponse<dynamic> response) => null);
    //   case Right():
    //     responses.fold((Failure failure) => null, (HttpResponse<dynamic> response) {
    //       final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    //       logger.f(datasJson);
    //       final List<ProjectModel> projects = datasJson.map<ProjectModel>(ProjectModel.fromJson).toList();
    //       emit.call(ProjectsShowOnGridMode(projects: projects));
    //     });
    //   default:
    //     emit.call(ProjectIsLoading());
    // }
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

    await DocumentHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => ProjectHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ProjectHandler.handleUpsertSuccess(response: response, emit: emit),
    );
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

  Future<void> _activeEditableItem(ProjectItemEditableActived event, Emitter<ProjectState> emit) async {
    emit.call(ProjectItemIsEditable());
  }

  Future<void> _cancelEditableItem(ProjectItemEditableCanceled event, Emitter<ProjectState> emit) async {
    emit.call(ProjectItemIsNotEditable());
  }
}

class ProjectHandler {
  const ProjectHandler._();

  static Future<void> withReponse({
    required Either<Failure, HttpResponse<dynamic>> responses,
    required ValueChanged<Failure> ifFailure,
    required ValueChanged<HttpResponse<dynamic>> ifSuccess,
  }) async {
    switch (responses) {
      case Left():
        responses.fold(
          (Failure failure) => ifFailure(failure),
          (HttpResponse<dynamic> response) => null,
        );
      case Right():
        responses.fold(
          (Failure failure) => null,
          (HttpResponse<dynamic> response) => ifSuccess(response),
        );
    }
  }

  static Future<void> handleAllFailures({required Failure failure, required Emitter<ProjectState> emit}) async {
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

  static Future<void> storeProjects({required List<ProjectModel> projects}) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.projectsEndPoint,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(projects),
      ),
    );
  }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProjectState> emit,
  }) async {
    emit.call(ProjectIsRemovedSuccessfully());
  }

  static Future<void> handleSearchSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProjectState> emit,
  }) async {
    debugPrint(response.data.toString());
    // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  }
}

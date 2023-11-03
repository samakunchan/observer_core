import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

part 'environment_datas_event.dart';
part 'environment_datas_state.dart';

class EnvironmentDatasBloc extends Bloc<EnvironmentDatasEvent, EnvironmentDatasState> {
  EnvironmentDatasBloc() : super(const EnvironmentDatasIsSusscessfullyLoaded(selectedId: 3)) {
    on<EnvironmentsDatasTriggered>(_showEnvironmentsDatas);
    on<EnvironmentsDatasInMemoryTriggered>(_showEnvironmentsDatasInMemory);
    on<EnvironmentsErrorsTriggered>(_showEnvironmentsErrors);
    on<EnvironmentsDatasSelected>(_selectAndShowOneEnvironment);
    on<EnvironmentsDatasSubmitted>(_upsertEnvironmentDatas);
    on<EnvironmentsDatasDeleted>(_deleteEnvironmentDatas);
  }

  Future<void> _showEnvironmentsDatas(EnvironmentsDatasTriggered event, Emitter<EnvironmentDatasState> emit) async {
    emit.call(
      EnvironmentDatasIsSusscessfullyLoaded(
        selectedId: 3,
        environments: event.environments,
        filteredEnvironments: event.environments.where((EnvironmentModel environment) => environment.id == 3).toList(),
      ),
    );
  }

  Future<void> _showEnvironmentsDatasInMemory(EnvironmentsDatasInMemoryTriggered event, Emitter<EnvironmentDatasState> emit) async {
    emit.call(
      EnvironmentDatasIsSusscessfullyLoadedInMemory(
        selectedId: 3,
        environments: event.environments,
        filteredEnvironments: event.environments.where((EnvironmentModel environment) => environment.id == 3).toList(),
      ),
    );
  }

  Future<void> _showEnvironmentsErrors(EnvironmentsErrorsTriggered event, Emitter<EnvironmentDatasState> emit) async {
    emit.call(EnvironmentDatasHasFailure(message: event.message));
  }

  Future<void> _selectAndShowOneEnvironment(EnvironmentsDatasSelected event, Emitter<EnvironmentDatasState> emit) async {
    emit.call(
      EnvironmentDatasIsSusscessfullyLoaded(
        environments: event.environments,
        filteredEnvironments: event.environments.where((EnvironmentModel environment) => environment.id == event.filterId).toList(),
        selectedId: event.filterId,
      ),
    );
  }

  Future<void> _upsertEnvironmentDatas(EnvironmentsDatasSubmitted event, Emitter<EnvironmentDatasState> emit) async {
    emit.call(EnvironmentsDatasIsSubmitting());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: accessToken,
        endPoint: MainProject.environmentsEndPoint,
        body: jsonEncode(event.environmentForUpsert.toJson()),
      ),
    );

    await EnvironementDatasHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => EnvironementDatasHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => EnvironementDatasHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }

  Future<void> _deleteEnvironmentDatas(EnvironmentsDatasDeleted event, Emitter<EnvironmentDatasState> emit) async {
    emit.call(EnvironmentsDatasIsSubmitting());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: accessToken,
        endPoint: MainProject.environmentsEndPoint,
        body: jsonEncode(event.environmentForDelete.toJson()),
      ),
    );

    await EnvironementDatasHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => EnvironementDatasHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => EnvironementDatasHandler.handledeleteSuccess(response: response, emit: emit),
    );
  }
}

class EnvironementDatasHandler {
  const EnvironementDatasHandler._();

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

  static Future<void> handleAllFailures({required Failure failure, required Emitter<EnvironmentDatasState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case CacheFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case BadRequestFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case NetworkFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case NotFoundFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case ForbiddenFailure():
        return emit.call(EnvironmentDatasHasFailure(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const EnvironmentDatasHasFailure());
      default:
        return emit.call(EnvironmentsDatasIsSubmitting());
    }
  }

  static Future<void> handleAllSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<EnvironmentDatasState> emit,
  }) async {
    final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    final List<EnvironmentModel> environments = datasJson.map<EnvironmentModel>(EnvironmentModel.fromJson).toList();

    emit.call(
      EnvironmentDatasIsSusscessfullyLoaded(
        environments: environments,
        filteredEnvironments: environments.where((EnvironmentModel environment) => environment.id == 3).toList(),
        selectedId: 3,
      ),
    );
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<EnvironmentDatasState> emit,
  }) async {
    emit.call(EnvironmentsDatasFormIsSubmittedSuccessfully(id: (response.data as Map<String, dynamic>)['id'] as int));
  }

  static Future<void> handledeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<EnvironmentDatasState> emit,
  }) async {
    emit.call(EnvironmentsDatasIsDeletedSuccessfully());
  }
}

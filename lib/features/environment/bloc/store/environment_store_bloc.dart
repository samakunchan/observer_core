import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/authentication/authentication_feature.dart';
import 'package:observer_core/features/authentication/feature_auth_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

part 'environment_store_event.dart';
part 'environment_store_state.dart';

class EnvironmentStoreBloc extends Bloc<EnvironmentStoreEvent, EnvironmentStoreState> {
  EnvironmentStoreBloc() : super(EnvironmentStoreInitial()) {
    on<EnvironmentsStoreTriggered>(_openEnvironmentsStore);
    on<EnvironmentsStoreInMemoryTriggered>(_openEnvironmentsInMemoryStore);
    on<EnvironmentsStoreReloaded>(_reloadEnvironmentsStore);
  }

  Future<void> _openEnvironmentsStore(EnvironmentsStoreTriggered event, Emitter<EnvironmentStoreState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit
        ..call(EnvironmentStoreIsLoading())
        ..call(EnvironmentsStoreIsOpen(environments: event.environments, selectedId: 3));
    } else {
      emit.call(EnvironmentStoreIsLoading());
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
        GetParams(endPoint: MainProject.environmentsEndPoint, accessToken: authTokenModel.accessToken),
      );

      await EnvironementStoreHandler.withReponse(
        responses: responses,
        ifFailure: (Failure failure) => EnvironementStoreHandler.handleAllFailures(failure: failure, emit: emit),
        ifSuccess: (HttpResponse<dynamic> response) => EnvironementStoreHandler.handleAllSuccess(response: response, emit: emit),
      );
    }
  }

  Future<void> _openEnvironmentsInMemoryStore(EnvironmentsStoreInMemoryTriggered event, Emitter<EnvironmentStoreState> emit) async {
    if (!event.isFetchingApi) {
      emit
        ..call(EnvironmentStoreIsLoading())
        ..call(EnvironmentsStoreIsOpen(environments: event.environments, selectedId: 3));
    } else {
      final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
      emit.call(EnvironmentStoreIsLoading());
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGLocalRepository.getResponses(
        GetParams(endPoint: MainProject.environmentsEndPoint, accessToken: authTokenModel.accessToken),
      );

      await EnvironementStoreHandler.withReponse(
        responses: responses,
        ifFailure: (Failure failure) => EnvironementStoreHandler.handleAllFailures(failure: failure, emit: emit),
        ifSuccess: (HttpResponse<dynamic> response) => EnvironementStoreHandler.handleAllSuccessInMemory(response: response, emit: emit),
      );
    }
  }

  Future<void> _reloadEnvironmentsStore(EnvironmentsStoreReloaded event, Emitter<EnvironmentStoreState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    emit.call(EnvironmentStoreIsLoading());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(endPoint: MainProject.environmentsEndPoint, accessToken: authTokenModel.accessToken),
    );

    await EnvironementStoreHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => EnvironementStoreHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => EnvironementStoreHandler.handleAllSuccess(response: response, emit: emit),
    );
  }
}

class EnvironementStoreHandler {
  const EnvironementStoreHandler._();

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

  static Future<void> handleAllFailures({required Failure failure, required Emitter<EnvironmentStoreState> emit}) async {
    print(failure);
    switch (failure) {
      case ServerFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case CacheFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case BadRequestFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case NetworkFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case NotFoundFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case ForbiddenFailure():
        return emit.call(EnvironementsStoreIsClosed(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const EnvironementsStoreIsClosed());
      default:
        return emit.call(EnvironmentStoreIsLoading());
    }
  }

  static Future<void> handleAllSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<EnvironmentStoreState> emit,
  }) async {
    final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    final List<EnvironmentModel> environments = datasJson.map<EnvironmentModel>(EnvironmentModel.fromJson).toList();
    emit.call(
      EnvironmentsStoreIsOpen(
        environments: environments,
        filteredEnvironments: environments.where((EnvironmentModel environment) => environment.id == 3).toList(),
        selectedId: 3,
      ),
    );

    await storeEnvironments(environments: environments);
  }

  static Future<void> handleAllSuccessInMemory({
    required HttpResponse<dynamic> response,
    required Emitter<EnvironmentStoreState> emit,
  }) async {
    final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    final List<EnvironmentModel> environments = datasJson.map<EnvironmentModel>(EnvironmentModel.fromJson).toList();
    emit.call(
      EnvironmentsStoreIsOpenInMemory(
        environments: environments,
        filteredEnvironments: environments.where((EnvironmentModel environment) => environment.id == 3).toList(),
        selectedId: 3,
      ),
    );
  }

  static Future<void> storeEnvironments({required List<EnvironmentModel> environments}) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.environmentsEndPoint,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(environments),
      ),
    );
  }
}

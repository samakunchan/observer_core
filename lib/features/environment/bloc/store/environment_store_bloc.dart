import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

part 'environment_store_event.dart';
part 'environment_store_state.dart';

class EnvironmentStoreBloc extends Bloc<EnvironmentStoreEvent, EnvironmentStoreState> {
  EnvironmentStoreBloc() : super(EnvironmentStoreInitial()) {
    on<EnvironmentsStoreRequested>(_openEnvironmentsStore);
    on<EnvironmentsStoreInMemoryRequested>(_openEnvironmentsInMemoryStore);
    on<EnvironmentsStoreReloaded>(_reloadEnvironmentsStore);
  }

  Future<void> _openEnvironmentsStore(EnvironmentsStoreRequested event, Emitter<EnvironmentStoreState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    emit.call(EnvironmentStoreIsLoading());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(endPoint: MainProject.environmentsEndPoint, accessToken: authTokenModel.accessToken),
    );

    const EnvironmentStoreHandler environmentStoreHandler = EnvironmentStoreHandler();
    switch (responses) {
      case Left():
        await environmentStoreHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await EnvironmentStoreHandler.handleAllSuccess(response: responses.value, emit: emit);
    }
  }

  Future<void> _openEnvironmentsInMemoryStore(EnvironmentsStoreInMemoryRequested event, Emitter<EnvironmentStoreState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    emit.call(EnvironmentStoreIsLoading());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGLocalRepository.getResponses(
      GetParams(endPoint: MainProject.environmentsEndPoint, accessToken: authTokenModel.accessToken),
    );

    const EnvironmentStoreHandler environmentStoreHandler = EnvironmentStoreHandler();
    switch (responses) {
      case Left():
        await environmentStoreHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await EnvironmentStoreHandler.handleAllSuccessInMemory(response: responses.value, emit: emit);
    }
  }

  Future<void> _reloadEnvironmentsStore(EnvironmentsStoreReloaded event, Emitter<EnvironmentStoreState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    emit.call(EnvironmentStoreIsLoading());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(endPoint: MainProject.environmentsEndPoint, accessToken: authTokenModel.accessToken),
    );

    const EnvironmentStoreHandler environmentStoreHandler = EnvironmentStoreHandler();
    switch (responses) {
      case Left():
        await environmentStoreHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await EnvironmentStoreHandler.handleAllSuccessInMemory(response: responses.value, emit: emit);
    }
  }
}

class EnvironmentStoreHandler {
  const EnvironmentStoreHandler();

  Future<void> handleAllFailures({required Failure failure, required Emitter<EnvironmentStoreState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case CacheFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case BadRequestFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case NetworkFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case NotFoundFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case ForbiddenFailure():
        return emit.call(EnvironmentsStoreIsClosed(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const EnvironmentsStoreIsClosed());
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

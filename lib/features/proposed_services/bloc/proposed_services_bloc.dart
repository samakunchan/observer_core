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
import 'package:retrofit/retrofit.dart';

part 'proposed_services_event.dart';
part 'proposed_services_state.dart';

class ProposedServicesBloc extends Bloc<ProposedServicesEvent, ProposedServicesState> {
  ProposedServicesBloc() : super(ProposedServicesInitial()) {
    on<ProposedServicesRequested>(_requestServices);
    on<ProposedServiceSubmitted>(_upsertAService);
    on<ProposedServiceDeleted>(_deleteAService);
    // on<ProposedServiceReloaded>(_reloadServices);
  }

  Future<void> _requestServices(ProposedServicesRequested event, Emitter<ProposedServicesState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        endPoint: MainProject.services,
        accessToken: authTokenModel.accessToken,
      ),
    );

    switch (responses) {
      case Left():
        responses.fold(
          (Failure failure) => ProposedServicesHandler.handleAllFailures(failure: failure, emit: emit),
          (HttpResponse<dynamic> response) => null,
        );
      case Right():
        responses.fold((Failure failure) => null, (HttpResponse<dynamic> response) {
          final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
          final List<ProposedServiceModel> services = datasJson.map<ProposedServiceModel>(ProposedServiceModel.fromJson).toList();
          emit.call(ProposedServicesAreLoadedSuccessfully(services: services));
        });
      default:
        emit.call(ProposedServicesAreLoading());
    }
  }

  Future<void> _upsertAService(ProposedServiceSubmitted event, Emitter<ProposedServicesState> emit) async {
    emit.call(ProposedServiceIsSubmitting());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.services,
        body: jsonEncode(event.proposedServiceDTO.toJson()),
      ),
    );

    await ProposedServicesHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => ProposedServicesHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ProposedServicesHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }

  Future<void> _deleteAService(ProposedServiceDeleted event, Emitter<ProposedServicesState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        body: event.id.toString(),
        endPoint: MainProject.services,
      ),
    );

    await ProposedServicesHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => ProposedServicesHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ProposedServicesHandler.handleDeleteSuccess(response: response, emit: emit),
    );
  }
}

class ProposedServicesHandler {
  const ProposedServicesHandler._();

  static Future<void> withResponse({
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

  static void handleAllFailures({required Failure failure, required Emitter<ProposedServicesState> emit}) {
    switch (failure) {
      case ServerFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case CacheFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case BadRequestFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case NetworkFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case NotFoundFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case ForbiddenFailure():
        return emit.call(ProposedServicesHaveFailure(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const ProposedServicesHaveFailure());
      default:
        return emit.call(ProposedServicesAreLoading());
    }
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProposedServicesState> emit,
  }) async {
    emit.call(ProposedServiceIsSubmittingSuccessfully());
  }

  static Future<void> storeProposedServices({required List<ProposedServiceModel> services}) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.services,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(services),
      ),
    );
  }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProposedServicesState> emit,
  }) async {
    emit.call(ProposedServiceIsRemovedSuccessfully());
  }

  static Future<void> handleSearchSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProposedServicesState> emit,
  }) async {
    debugPrint(response.data.toString());
    // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  }
}

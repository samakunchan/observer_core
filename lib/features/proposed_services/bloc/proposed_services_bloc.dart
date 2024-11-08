import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
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

    const ProposedServicesHandler proposedServicesHandler = ProposedServicesHandler();
    switch (responses) {
      case Left():
        await proposedServicesHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        final List<Map<String, dynamic>> datasJson = (responses.value.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
        final List<ProposedServiceModel> services = datasJson.map<ProposedServiceModel>(ProposedServiceModel.fromJson).toList();
        emit.call(ProposedServicesAreLoadedSuccessfully(services: services));
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

    const ProposedServicesHandler proposedServicesHandler = ProposedServicesHandler();
    switch (responses) {
      case Left():
        await proposedServicesHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await ProposedServicesHandler.handleUpsertSuccess(response: responses.value, emit: emit);
    }
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

    const ProposedServicesHandler proposedServicesHandler = ProposedServicesHandler();
    switch (responses) {
      case Left():
        await proposedServicesHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await ProposedServicesHandler.handleDeleteSuccess(response: responses.value, emit: emit);
    }
  }
}

class ProposedServicesHandler {
  const ProposedServicesHandler();

  Future<void> handleAllFailures({required Failure failure, required Emitter<ProposedServicesState> emit}) async {
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

  // static Future<void> storeProposedServices({required List<ProposedServiceModel> services}) async {
  //   final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
  //   await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
  //     UpsertParams(
  //       endPoint: MainProject.services,
  //       accessToken: authTokenModel.accessToken,
  //       body: jsonEncode(services),
  //     ),
  //   );
  // }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ProposedServicesState> emit,
  }) async {
    emit.call(ProposedServiceIsRemovedSuccessfully());
  }

  // static Future<void> handleSearchSuccess({
  //   required HttpResponse<dynamic> response,
  //   required Emitter<ProposedServicesState> emit,
  // }) async {
  //   debugPrint(response.data.toString());
  //   // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  // }
}

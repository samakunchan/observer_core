import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos_export.dart';
import 'package:observer_core/enums/enums.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

part 'reason_event.dart';
part 'reason_state.dart';

class ReasonBloc extends Bloc<ReasonEvent, ReasonState> {
  ReasonBloc() : super(ReasonInitial()) {
    on<ReasonsRequested>(_requestReasons);
    on<ReasonsUpdated>(_updateReasons);
    on<ReasonSubmitted>(_upsertAReason);
    on<ReasonDeleted>(_deleteAReason);
  }

  Future<void> _requestReasons(ReasonsRequested event, Emitter<ReasonState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        endPoint: MainProject.reasons,
        accessToken: authTokenModel.accessToken,
      ),
    );

    switch (responses) {
      case Left():
        responses.fold(
          (Failure failure) => ReasonsHandler.handleAllFailures(failure: failure, emit: emit),
          (HttpResponse<dynamic> response) => null,
        );
      case Right():
        responses.fold((Failure failure) => null, (HttpResponse<dynamic> response) {
          final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
          final List<ReasonModel> reasons = datasJson.map<ReasonModel>(ReasonModel.fromJson).toList();
          emit.call(ReasonsAreLoadedSuccessfully(reasons: reasons));
        });
      default:
        emit.call(ReasonsAreLoading());
    }
  }

  Future<void> _updateReasons(ReasonsUpdated event, Emitter<ReasonState> emit) async {
    emit.call(ReasonsAreLoadedSuccessfully(reasons: event.reasons));
  }

  Future<void> _upsertAReason(ReasonSubmitted event, Emitter<ReasonState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.reasons,
        body: jsonEncode(event.reasonsDTO.toJson()),
      ),
    );

    await ReasonsHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => ReasonsHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ReasonsHandler.handleUpsertSuccess(
        response: response,
        emit: emit,
        status: event.reasonsDTO.id != null ? UpsertFormType.update : UpsertFormType.create,
      ),
    );
  }

  Future<void> _deleteAReason(ReasonDeleted event, Emitter<ReasonState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        body: event.id.toString(),
        endPoint: MainProject.reasons,
      ),
    );

    await ReasonsHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => ReasonsHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ReasonsHandler.handleDeleteSuccess(response: response, emit: emit),
    );
  }
}

class ReasonsHandler {
  const ReasonsHandler._();

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

  static void handleAllFailures({required Failure failure, required Emitter<ReasonState> emit}) {
    switch (failure) {
      case ServerFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case CacheFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case BadRequestFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case NetworkFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case NotFoundFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case ForbiddenFailure():
        return emit.call(ReasonsHaveFailure(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const ReasonsHaveFailure());
      default:
        return emit.call(ReasonsAreLoading());
    }
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ReasonState> emit,
    required UpsertFormType status,
  }) async {
    final ReasonModel reason = ReasonModel.fromJson(response.data as Map<String, dynamic>);
    emit.call(ReasonIsSubmittingSuccessfully(reason: reason, status: status));
  }

  static Future<void> storeReasons({required List<ReasonModel> skills}) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.skills,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(skills),
      ),
    );
  }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ReasonState> emit,
  }) async {
    emit.call(ReasonIsRemovedSuccessfully());
  }

  static Future<void> handleSearchSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<ReasonState> emit,
  }) async {
    debugPrint(response.data.toString());
    // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  }
}

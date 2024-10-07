import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/documents/one_document_upsert_dto.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

part 'document_infos_event.dart';
part 'document_infos_state.dart';

class DocumentInfosBloc extends Bloc<DocumentInfosEvent, DocumentInfosState> {
  DocumentInfosBloc() : super(DocumentInfosInitial()) {
    on<DocumentSelected>(_selectOneDocument);
    on<DocumentInfosStarted>(_showInfos);
    on<DocumentInfosStoped>(_hideInfos);
    on<DocumentInfosEditableActived>(_activeEditableInfos);
    on<DocumentInfosEditableCanceled>(_cancelEditableInfos);
    on<DocumentInfosFormIsSubmitted>(_documentUpsert);
  }

  Future<void> _selectOneDocument(DocumentSelected event, Emitter<DocumentInfosState> emit) async {
    emit.call(DocumentInfosIsSelected(documentSelected: event.documentSelected));
  }

  Future<void> _showInfos(DocumentInfosStarted event, Emitter<DocumentInfosState> emit) async {
    emit.call(DocumentInfosOn());
  }

  Future<void> _hideInfos(DocumentInfosStoped event, Emitter<DocumentInfosState> emit) async {
    emit.call(DocumentInfosOff());
  }

  Future<void> _activeEditableInfos(DocumentInfosEditableActived event, Emitter<DocumentInfosState> emit) async {
    emit.call(DocumentInfosIsEditable(documentToEdit: event.documentToEdit));
  }

  Future<void> _cancelEditableInfos(DocumentInfosEditableCanceled event, Emitter<DocumentInfosState> emit) async {
    emit.call(DocumentInfosIsNotEditable(documentUpdated: event.documentUpdated));
  }

  Future<void> _documentUpsert(DocumentInfosFormIsSubmitted event, Emitter<DocumentInfosState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsEndPoint,
        body: jsonEncode(event.oneDocumentUpsertDTO.toJson()),
      ),
    );

    await ProjectInfosHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => ProjectInfosHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => ProjectInfosHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }
}

class ProjectInfosHandler {
  const ProjectInfosHandler._();

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

  static Future<void> handleAllFailures({required Failure failure, required Emitter<DocumentInfosState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case CacheFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case BadRequestFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case NetworkFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case NotFoundFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case ForbiddenFailure():
        return emit.call(DocumentInfosHaveFailures(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const DocumentInfosHaveFailures());
      default:
        return emit.call(DocumentInfosIsLoading());
    }
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<DocumentInfosState> emit,
  }) async {
    final Map<String, dynamic> dataJson = response.data as Map<String, dynamic>;
    final DocumentModel document = DocumentModel.fromJson(dataJson);

    emit(DocumentInfosFormIsSubmittedSuccessfully(documentUpdated: document));
  }
}

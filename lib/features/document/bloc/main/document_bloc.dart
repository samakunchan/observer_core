import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/enums/enums.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:observer_core/utils.dart';
import 'package:retrofit/dio.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc() : super(DocumentInitial()) {
    on<DocumentsFormReset>(_resetStateForm);
    on<DocumentDeleted>(_deleteDocument);
    on<DocumentsDeleted>(_deleteMultipleDocument);
    on<DocumentsInProgress>(_showFormLoader);
    on<DocumentActionCreateCalled>(_showCreateAction);
    on<DocumentActionUpdateCalled>(_showUpdateAction);
    on<DocumentsInGridAreCalled>(_requestAllDocumentsInGridView);
    on<DocumentsInListAreCalled>(_requestAllDocumentsInListView);
    on<DocumentsFilteredAreCalled>(_requestFilteredDocuments);
    on<DocumentIsCalled>(_requestOneDocument);
    on<OneDocumentToUpload>(_uploadOneDocument);
    on<MultipleDocumentsToUpload>(_uploadMultipleDocuments);
    on<DocumentsReloaded>(_reloadDocuments);
    on<DocumentsFailed>(_somethingWentWrong);
    on<DocumentsErrorPageShown>(_showErrorPage);

    /// Pas sure qu'on garde. A supprimer prochainement.
    on<DocumentsOnReconnect>(_reconnection);
  }

  FutureOr<void> _reconnection(DocumentsOnReconnect event, Emitter<DocumentState> emit) async {
    emit(DocumentInitial());
  }

  FutureOr<void> _resetStateForm(DocumentsFormReset event, Emitter<DocumentState> emit) async {
    emit(DocumentInitial());
  }

  FutureOr<void> _showFormLoader(DocumentsInProgress event, Emitter<DocumentState> emit) async {
    emit(DocumentsFormIsProcessing(formProcess: event.formProcess));
  }

  FutureOr<void> _deleteDocument(DocumentDeleted event, Emitter<DocumentState> emit) async {
    // final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    // final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
    //   DeleteParams(
    //     accessToken: authTokenModel.accessToken,
    //     endPoint: MainProject.categoriesEndPoint,
    //     body: jsonEncode(
    //       {
    //         'documentsIds': [event.documentForDelete.id],
    //       },
    //     ),
    //   ),
    // );
    //
    // await DocumentHandler.withResponse(
    //   responses: responses,
    //   ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
    //   ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleDeleteSuccess(
    //     response: response,
    //     emit: emit,
    //     documentDeleted: event.documentForDelete,
    //   ),
    // );
    // emit(const DocumentFormIsDeletedSuccessfully());
  }

  FutureOr<void> _deleteMultipleDocument(DocumentsDeleted event, Emitter<DocumentState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsMultiDeleteEndPoint,
        body: jsonEncode(
          {
            'documentsIds': event.documentIdsForDelete,
          },
        ),
      ),
    );

    await DocumentHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleDeleteSuccess(
        response: response,
        emit: emit,
      ),
    );
    emit(const DocumentFormIsDeletedSuccessfully());
  }

  FutureOr<void> _requestAllDocumentsInGridView(DocumentsInGridAreCalled event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsAreLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit.call(DocumentsAreLoadedSuccessfully(documentResponse: event.documentResponse));
    } else {
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
        GetParams(
          accessToken: authTokenModel.accessToken,
          endPoint: MainProject.documentsEndPoint,
        ),
      );

      await DocumentHandler.withResponse(
        responses: responses,
        ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
        ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleAllSuccess(response: response, emit: emit),
      );
    }
  }

  FutureOr<void> _requestAllDocumentsInListView(DocumentsInListAreCalled event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsAreLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit.call(
        DocumentsAreLoadedSuccessfully(documentResponse: event.documentResponse, screenMode: ScreenMode.list),
      );
    } else {
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
        GetParams(
          accessToken: authTokenModel.accessToken,
          endPoint: MainProject.documentsEndPoint,
        ),
      );

      await DocumentHandler.withResponse(
        responses: responses,
        ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
        ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleAllSuccess(response: response, emit: emit),
      );
    }
  }

  FutureOr<void> _requestFilteredDocuments(DocumentsFilteredAreCalled event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsAreLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsEndPoint,
        filteredBy: event.filteredBy,
      ),
    );

    await DocumentHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleAllSuccess(response: response, emit: emit),
    );
  }

  FutureOr<void> _requestOneDocument(DocumentIsCalled event, Emitter<DocumentState> emit) async {
    // TODO: implement event handler
  }

  FutureOr<void> _showCreateAction(DocumentActionCreateCalled event, Emitter<DocumentState> emit) async {
    emit.call(const DocumentToCreateForm());
  }

  FutureOr<void> _showUpdateAction(DocumentActionUpdateCalled event, Emitter<DocumentState> emit) async {
    emit.call(const DocumentToUpdateForm());
  }

  FutureOr<void> _uploadOneDocument(OneDocumentToUpload event, Emitter<DocumentState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.uploadFormData(
      UploadFormDataParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsUploadEndPoint,
        formData: event.formData,
      ),
    );

    await DocumentHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }

  FutureOr<void> _uploadMultipleDocuments(MultipleDocumentsToUpload event, Emitter<DocumentState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.uploadFormData(
      UploadFormDataParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsMultiUploadEndPoint,
        formData: event.formData,
      ),
    );

    await DocumentHandler.withResponse(
      responses: responses,
      ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }

  Future<void> _reloadDocuments(DocumentsReloaded event, Emitter<DocumentState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsEndPoint,
        filteredBy: event.filteredBy,
      ),
    );

    switch (responses) {
      case Left():
        await responses.fold(
          (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
          (HttpResponse<dynamic> response) => null,
        );
      case Right():
        await responses.fold(
          (Failure failure) => null,
          (HttpResponse<dynamic> response) => DocumentHandler.handleAllSuccess(response: response, emit: emit),
        );
      default:
        emit.call(DocumentsAreLoading());
    }
  }

  Future<void> _somethingWentWrong(DocumentsFailed event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsHaveFailures(message: event.message));
  }

  Future<void> _showErrorPage(DocumentsErrorPageShown event, Emitter<DocumentState> emit) async {
    logger.t('On lance le state pour charger la page d‘érreur.');
    emit.call(DocumentWithErrorPage(message: event.message));
  }
}

class DocumentHandler {
  const DocumentHandler._();

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

  static Future<void> handleAllFailures({required Failure failure, required Emitter<DocumentState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case CacheFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case BadRequestFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case NetworkFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case NotFoundFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case ForbiddenFailure():
        return emit.call(DocumentsHaveFailures(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const DocumentsHaveFailures(message: ErrorMessage.noErrorMessageHandled));
      default:
        return emit.call(DocumentsAreLoading());
    }
  }

  static Future<void> handleAllSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<DocumentState> emit,
    ScreenMode screenMode = ScreenMode.grid,
  }) async {
    final DocumentResponse documentResponse = DocumentResponse.fromJson(response.data as Map<String, dynamic>);

    if (screenMode == ScreenMode.grid) {
      emit.call(DocumentsAreLoadedSuccessfully(documentResponse: documentResponse));
    } else {
      emit.call(DocumentsAreLoadedSuccessfully(documentResponse: documentResponse, screenMode: ScreenMode.list));
    }
    //
    // await storeCategories(categories: categories);
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<DocumentState> emit,
  }) async {
    if (response.data.runtimeType == List) {
      final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
      final List<DocumentModel> documents = datasJson.map(DocumentModel.fromJson).toList();

      emit(DocumentFormIsSubmittedSuccessfully(documents: documents));
    } else {
      emit(DocumentFormIsSubmittedSuccessfully(documents: [DocumentModel.fromJson(response.data as Map<String, dynamic>)]));
    }
  }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<DocumentState> emit,
  }) async {
    emit.call(const DocumentFormIsDeletedSuccessfully());
  }
}

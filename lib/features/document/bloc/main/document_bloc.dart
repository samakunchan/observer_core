import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/enums/enums_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/dio.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc() : super(DocumentInitial()) {
    on<DocumentsFormReset>(_resetStateForm);
    // on<DocumentDeleted>(_deleteDocument);
    on<DocumentsDeleted>(_deleteMultipleDocument);
    on<DocumentsInProgress>(_showFormLoader);
    on<DocumentActionCreateCalled>(_showCreateAction);
    on<DocumentActionUpdateCalled>(_showUpdateAction);
    on<DocumentsInGridAreCalled>(_requestAllDocumentsInGridView);
    on<DocumentsInListAreCalled>(_requestAllDocumentsInListView);
    on<DocumentsFilteredAreCalled>(_requestFilteredDocuments);
    // on<OneDocumentToUpload>(_uploadOneDocument);
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

  FutureOr<void> _requestAllDocumentsInGridView(DocumentsInGridAreCalled event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsAreLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsEndPoint,
      ),
    );

    const DocumentHandler documentHandler = DocumentHandler();
    switch (responses) {
      case Left():
        await documentHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await DocumentHandler.handleAllSuccess(response: responses.value, emit: emit);
    }
  }

  FutureOr<void> _requestAllDocumentsInListView(DocumentsInListAreCalled event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsAreLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsEndPoint,
      ),
    );

    const DocumentHandler documentHandler = DocumentHandler();
    switch (responses) {
      case Left():
        await documentHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await DocumentHandler.handleAllSuccess(response: responses.value, emit: emit, screenMode: ScreenMode.list);
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

    const DocumentHandler documentHandler = DocumentHandler();
    switch (responses) {
      case Left():
        await documentHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await DocumentHandler.handleAllSuccess(response: responses.value, emit: emit);
    }
  }

  Future<void> _reloadDocuments(DocumentsReloaded event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsAreLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.documentsEndPoint,
        filteredBy: event.filteredBy,
      ),
    );

    const DocumentHandler documentHandler = DocumentHandler();
    switch (responses) {
      case Left():
        await documentHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await DocumentHandler.handleAllSuccess(response: responses.value, emit: emit);
    }
  }

  FutureOr<void> _showCreateAction(DocumentActionCreateCalled event, Emitter<DocumentState> emit) async {
    emit.call(const DocumentToCreateForm());
  }

  FutureOr<void> _showUpdateAction(DocumentActionUpdateCalled event, Emitter<DocumentState> emit) async {
    emit.call(const DocumentToUpdateForm());
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

    const DocumentHandler documentHandler = DocumentHandler();
    switch (responses) {
      case Left():
        await documentHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await DocumentHandler.handleUpsertSuccess(response: responses.value, emit: emit);
    }
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

    const DocumentHandler documentHandler = DocumentHandler();
    switch (responses) {
      case Left():
        await documentHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await DocumentHandler.handleDeleteSuccess(response: responses.value, emit: emit);
    }
  }

  Future<void> _somethingWentWrong(DocumentsFailed event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsHaveFailures(message: event.message));
  }

  Future<void> _showErrorPage(DocumentsErrorPageShown event, Emitter<DocumentState> emit) async {
    emit.call(DocumentsHaveFailures(message: event.message));
  }
}

class DocumentHandler {
  const DocumentHandler();

  Future<void> handleAllFailures({required Failure failure, required Emitter<DocumentState> emit}) async {
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
        return emit.call(const DocumentsHaveFailures());
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

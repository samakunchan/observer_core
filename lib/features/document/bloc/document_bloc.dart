import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/document/document_model.dart';
import 'package:retrofit/dio.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc() : super(DocumentInitial()) {
    on<DocumentsFormReset>(_resetStateForm);
    on<DocumentsDeleted>(_handleDeleteState);
    on<DocumentsInProgress>(_showLoader);
    on<DocumentsAreCalled>(_requestAllDocuments);
    on<DocumentIsCalled>(_requestOneDocument);
    on<OneDocumentToUpload>(_uploadOneDocument);
    on<MultipleDocumentsToUpload>(_uploadMultipleDocuments);
  }

  FutureOr<void> _resetStateForm(DocumentsFormReset event, Emitter<DocumentState> emit) async {
    emit(DocumentInitial());
  }

  FutureOr<void> _showLoader(DocumentsInProgress event, Emitter<DocumentState> emit) async {
    emit(DocumentsFormIsProcessing());
  }

  FutureOr<void> _handleDeleteState(DocumentsDeleted event, Emitter<DocumentState> emit) async {
    emit(const DocumentFormIsDeletedSuccessfully());
  }

  FutureOr<void> _requestAllDocuments(DocumentsAreCalled event, Emitter<DocumentState> emit) async {
    // TODO: implement event handler
  }

  FutureOr<void> _requestOneDocument(DocumentIsCalled event, Emitter<DocumentState> emit) async {
    // TODO: implement event handler
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

    await DocumentHandler.withReponse(
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

    await DocumentHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => DocumentHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => DocumentHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }
}

class DocumentHandler {
  const DocumentHandler._();

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
        return emit.call(const DocumentsHaveFailures());
      default:
        return emit.call(DocumentsAreLoading());
    }
  }

  static Future<void> handleAllSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<DocumentState> emit,
  }) async {
    // final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    // logger.f(datasJson);
    // final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
    //
    // if (screenMode == ScreenMode.grid) {
    //   emit.call(CategoriesAreLoadedSuccessfully(categories: categories, selectedId: 1));
    // } else {
    //   emit.call(CategoriesAreLoadedSuccessfully(categories: categories, screenMode: ScreenMode.list, selectedId: 1));
    // }
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
}

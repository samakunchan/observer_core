import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos.dart';
import 'package:observer_core/enums/enums.dart';
import 'package:observer_core/features/authentication/authentication_feature.dart';
import 'package:observer_core/features/authentication/feature_auth_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/dio.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoriesInitialized>(_reInitilizeCategories);
    on<CategoriesInGridTriggered>(_showAllCategoriesInGridView);
    on<CategoriesInGridTriggeredInMemory>(_showAllCategoriesInMemoryInGridView);
    on<CategoriesInListTriggered>(_showAllCategoriesListView);
    on<CategoriesInListTriggeredInMemory>(_showAllCategoriesInMemoryListView);
    on<CategoriesReloaded>(_reloadCategories);
    on<CategoryDeleted>(_deleteCategory);
    on<CategoryFiltered>(_filterCategories);
    on<CategorySubmitted>(_upsertCategory);
    on<CategoriesTested>(_testCategory);
  }

  Future<void> _testCategory(CategoriesTested event, Emitter<CategoryState> emit) async {
    emit.call(const CategoryIsDeletedSuccessfully(categoryDeleted: CategoryModel.empty));
  }

  Future<void> _reInitilizeCategories(CategoriesInitialized event, Emitter<CategoryState> emit) async {
    emit.call(CategoryInitial());
  }

  /// GRID VIEW API
  Future<void> _showAllCategoriesInGridView(CategoriesInGridTriggered event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit
        ..call(CategoryIsLoading())
        ..call(CategoriesAreLoadedSuccessfully(categories: event.categories, selectedId: 1));
    } else {
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
        GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
      );

      switch (responses) {
        case Left():
          await responses.fold(
            (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
            (HttpResponse<dynamic> response) => null,
          );
        case Right():
          await responses.fold(
            (Failure failure) => null,
            (HttpResponse<dynamic> response) => CategoryHandler.handleAllSuccess(response: response, emit: emit),
          );
        default:
          emit.call(CategoryIsLoading());
      }
    }
  }

  /// GRID VIEW LOCAL
  Future<void> _showAllCategoriesInMemoryInGridView(CategoriesInGridTriggeredInMemory event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit
        ..call(CategoryIsLoading())
        ..call(CategoriesAreLoadedSuccessfully(categories: event.categories, selectedId: 1));
    } else {
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGLocalRepository.getResponses(
        GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
      );

      switch (responses) {
        case Left():
          await responses.fold(
            (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
            (HttpResponse<dynamic> response) => null,
          );
        case Right():
          await responses.fold(
            (Failure failure) => null,
            (HttpResponse<dynamic> response) => CategoryHandler.handleAllSuccess(response: response, emit: emit),
          );
        default:
          emit.call(CategoryIsLoading());
      }
    }
  }

  /// List VIEW API
  Future<void> _showAllCategoriesListView(CategoriesInListTriggered event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit
        ..call(CategoryIsLoading())
        ..call(CategoriesAreLoadedSuccessfully(categories: event.categories, screenMode: ScreenMode.list, selectedId: 1));
    } else {
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
        GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
      );

      switch (responses) {
        case Left():
          await responses.fold(
            (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
            (HttpResponse<dynamic> response) => null,
          );
        case Right():
          await responses.fold(
            (Failure failure) => null,
            (HttpResponse<dynamic> response) =>
                CategoryHandler.handleAllSuccess(response: response, emit: emit, screenMode: ScreenMode.list),
          );
        default:
          emit.call(CategoryIsLoading());
      }
    }
  }

  /// List VIEW LOCAL
  Future<void> _showAllCategoriesInMemoryListView(CategoriesInListTriggeredInMemory event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    if (!event.isFetchingApi) {
      emit
        ..call(CategoryIsLoading())
        ..call(CategoriesAreLoadedSuccessfully(categories: event.categories, screenMode: ScreenMode.list, selectedId: 1));
    } else {
      final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGLocalRepository.getResponses(
        GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
      );

      switch (responses) {
        case Left():
          await responses.fold(
            (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
            (HttpResponse<dynamic> response) => null,
          );
        case Right():
          await responses.fold(
            (Failure failure) => null,
            (HttpResponse<dynamic> response) => _handleAllSuccessForInMemory(response: response, emit: emit),
          );
        default:
          emit.call(CategoryIsLoading());
      }
    }
  }

  Future<void> _reloadCategories(CategoriesReloaded event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(endPoint: MainProject.categoriesEndPoint, accessToken: authTokenModel.accessToken),
    );

    switch (responses) {
      case Left():
        await responses.fold(
          (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
          (HttpResponse<dynamic> response) => null,
        );
      case Right():
        await responses.fold(
          (Failure failure) => null,
          (HttpResponse<dynamic> response) => CategoryHandler.handleAllSuccess(response: response, emit: emit),
        );
      default:
        emit.call(CategoryIsLoading());
    }
  }

  Future<void> _deleteCategory(CategoryDeleted event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    emit.call(CategoryIsLoading());
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.categoriesEndPoint,
        body: jsonEncode(
          {
            'categoriesIds': [event.categoryForDelete.id],
          },
        ),
      ),
    );

    await CategoryHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => CategoryHandler.handleDeleteSuccess(
        response: response,
        emit: emit,
        categoryDeleted: event.categoryForDelete,
      ),
    );
    emit.call(CategoryIsRemovedSuccessfully());
  }

  FutureOr<void> _filterCategories(CategoryFiltered event, Emitter<CategoryState> emit) async {
    final List<CategoryModel> filteredCategories =
        event.categories.where((CategoryModel category) => category.title == event.filterInText).toList();
    emit.call(
      CategoriesAreFilteredSuccessfully(
        categories: event.categories,
        filteredCategories: event.filterInText.isNotEmpty ? filteredCategories : event.categories,
        screenMode: event.screenMode,
      ),
    );
  }

  Future<void> _upsertCategory(CategorySubmitted event, Emitter<CategoryState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.categoriesEndPoint,
        body: jsonEncode(event.categoryForUpsert.toJson()),
      ),
    );

    await CategoryHandler.withReponse(
      responses: responses,
      ifFailure: (Failure failure) => CategoryHandler.handleAllFailures(failure: failure, emit: emit),
      ifSuccess: (HttpResponse<dynamic> response) => CategoryHandler.handleUpsertSuccess(response: response, emit: emit),
    );
  }

  Future<void> _handleAllSuccessForInMemory({required HttpResponse<dynamic> response, required Emitter<CategoryState> emit}) async {
    final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
    emit.call(CategoriesInMemoryAreLoadedSuccessfully(categories: categories));
  }
}

class CategoryHandler {
  const CategoryHandler._();

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

  static Future<void> handleAllFailures({required Failure failure, required Emitter<CategoryState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case CacheFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case BadRequestFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case NetworkFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case NotFoundFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case ForbiddenFailure():
        return emit.call(CategoriesAreNotLoaded(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const CategoriesAreNotLoaded());
      default:
        return emit.call(CategoryIsLoading());
    }
  }

  static Future<void> handleAllSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<CategoryState> emit,
    ScreenMode screenMode = ScreenMode.grid,
  }) async {
    final List<Map<String, dynamic>> datasJson = (response.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();

    if (screenMode == ScreenMode.grid) {
      emit.call(CategoriesAreLoadedSuccessfully(categories: categories, selectedId: 1));
    } else {
      emit.call(CategoriesAreLoadedSuccessfully(categories: categories, screenMode: ScreenMode.list, selectedId: 1));
    }

    await storeCategories(categories: categories);
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<CategoryState> emit,
  }) async {
    emit.call(CategoryFormIsSubmittedSuccessfully());
  }

  static Future<void> storeCategories({required List<CategoryModel> categories}) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.categoriesEndPoint,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(categories),
      ),
    );
  }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<CategoryState> emit,
    required CategoryModel categoryDeleted,
  }) async {
    emit.call(CategoryIsDeletedSuccessfully(categoryDeleted: categoryDeleted));
  }

  static Future<void> handleSearchSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<CategoryState> emit,
  }) async {
    debugPrint(response.data.toString());
    // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  }
}

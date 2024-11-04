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

part 'about_me_event.dart';
part 'about_me_state.dart';

class AboutMeBloc extends Bloc<AboutMeEvent, AboutMeState> {
  AboutMeBloc() : super(AboutMeInitial()) {
    on<AboutMeRequested>(_requestAboutMeDatas);
    on<AboutMeSubmitted>(_upsertAboutMe);
  }

  Future<void> _requestAboutMeDatas(AboutMeRequested event, Emitter<AboutMeState> emit) async {
    emit.call(AboutMeIsLoading());
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        endPoint: MainProject.aboutme,
        accessToken: authTokenModel.accessToken,
      ),
    );

    switch (responses) {
      case Left():
        AboutMeHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        final List<Map<String, dynamic>> datasJson = (responses.value.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
        final List<AboutMeModel> aboutMeModel = datasJson.map<AboutMeModel>(AboutMeModel.fromJson).toList();
        emit.call(
          AboutMeIsLoadedSuccessfully(
            aboutMe: aboutMeModel.isNotEmpty ? aboutMeModel.first : AboutMeModel.emptyDatas,
          ),
        );
    }
  }

  Future<void> _upsertAboutMe(AboutMeSubmitted event, Emitter<AboutMeState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.aboutme,
        body: jsonEncode(event.aboutsDTO.toJson()),
      ),
    );
    switch (responses) {
      case Left():
        AboutMeHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await AboutMeHandler.handleUpsertSuccess(response: responses.value, emit: emit);
    }
  }
}

class AboutMeHandler {
  const AboutMeHandler._();

  static void handleAllFailures({required Failure failure, required Emitter<AboutMeState> emit}) {
    switch (failure) {
      case ServerFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case CacheFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case BadRequestFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case NetworkFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case NotFoundFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case ForbiddenFailure():
        return emit.call(AboutMeHasFailure(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const AboutMeHasFailure());
      default:
        return emit.call(AboutMeIsLoading());
    }
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<AboutMeState> emit,
  }) async {
    final AboutMeModel aboutMeModel = AboutMeModel.fromJson(response.data as Map<String, dynamic>);
    emit.call(AboutMeIsSubmittingSuccessfully(aboutMe: aboutMeModel));
  }

  static Future<void> storeAboutMe({required AboutMeModel aboutMe}) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
    await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.aboutme,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(aboutMe),
      ),
    );
  }
}

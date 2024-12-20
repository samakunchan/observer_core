import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos_export.dart';
import 'package:observer_core/enums/enums_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

part 'skill_event.dart';
part 'skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitial()) {
    on<SkillsRequested>(_requestSkills);
    on<SkillsUpdated>(_updateSkills);
    on<SkillSubmitted>(_upsertASkill);
    on<SkillDeleted>(_deleteASkill);
  }

  Future<void> _requestSkills(SkillsRequested event, Emitter<SkillState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.getResponses(
      GetParams(
        endPoint: MainProject.skills,
        accessToken: authTokenModel.accessToken,
      ),
    );

    const SkillsHandler skillsHandler = SkillsHandler();
    switch (responses) {
      case Left():
        await skillsHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        final List<Map<String, dynamic>> datasJson = (responses.value.data as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
        final List<SkillModel> skills = datasJson.map<SkillModel>(SkillModel.fromJson).toList();
        emit.call(SkillsAreLoadedSuccessfully(skills: skills));
    }
  }

  Future<void> _upsertASkill(SkillSubmitted event, Emitter<SkillState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.upsertOne(
      UpsertParams(
        accessToken: authTokenModel.accessToken,
        endPoint: MainProject.skills,
        body: jsonEncode(event.skillsDTO.toJson()),
      ),
    );

    const SkillsHandler skillsHandler = SkillsHandler();
    switch (responses) {
      case Left():
        await skillsHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await SkillsHandler.handleUpsertSuccess(
          response: responses.value,
          emit: emit,
          status: event.skillsDTO.id != null ? UpsertFormType.update : UpsertFormType.create,
        );
    }
  }

  Future<void> _deleteASkill(SkillDeleted event, Emitter<SkillState> emit) async {
    final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();

    final Either<Failure, HttpResponse<dynamic>> responses = await ServerFeature.instanceOfPPGApiRepository.deleteOne(
      DeleteParams(
        accessToken: authTokenModel.accessToken,
        body: event.id.toString(),
        endPoint: MainProject.skills,
      ),
    );

    const SkillsHandler skillsHandler = SkillsHandler();
    switch (responses) {
      case Left():
        await skillsHandler.handleAllFailures(failure: responses.value, emit: emit);
      case Right():
        await SkillsHandler.handleDeleteSuccess(response: responses.value, emit: emit);
    }
  }

  Future<void> _updateSkills(SkillsUpdated event, Emitter<SkillState> emit) async {
    emit.call(SkillsAreLoadedSuccessfully(skills: event.skills));
  }
}

class SkillsHandler {
  const SkillsHandler();

  Future<void> handleAllFailures({required Failure failure, required Emitter<SkillState> emit}) async {
    switch (failure) {
      case ServerFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case CacheFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case BadRequestFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case NetworkFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case NotFoundFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case UnAuthorizedFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case ForbiddenFailure():
        return emit.call(SkillsHaveFailure(message: failure.message));
      case IDontKnowWhatImDoingFailure():
        return emit.call(const SkillsHaveFailure());
      default:
        return emit.call(SkillsAreLoading());
    }
  }

  static Future<void> handleUpsertSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<SkillState> emit,
    required UpsertFormType status,
  }) async {
    final SkillModel skill = SkillModel.fromJson(response.data as Map<String, dynamic>);
    emit.call(SkillIsSubmittingSuccessfully(skill: skill, status: status));
  }

  // static Future<void> storeSkills({required List<SkillModel> skills}) async {
  //   final AuthTokenModel authTokenModel = await AuthenticationFeature.instanceOfSecureStorageForToken.getAuthToken();
  //   await ServerFeature.instanceOfPPGLocalRepository.upsertResponses(
  //     UpsertParams(
  //       endPoint: MainProject.skills,
  //       accessToken: authTokenModel.accessToken,
  //       body: jsonEncode(skills),
  //     ),
  //   );
  // }

  static Future<void> handleDeleteSuccess({
    required HttpResponse<dynamic> response,
    required Emitter<SkillState> emit,
  }) async {
    emit.call(SkillIsRemovedSuccessfully());
  }
  //
  // static Future<void> handleSearchSuccess({
  //   required HttpResponse<dynamic> response,
  //   required Emitter<SkillState> emit,
  // }) async {
  //   debugPrint(response.data.toString());
  //   // emit.call(EnvironmentsDatasIsSearchSuccessfully(searchModel: SearchModel.fromJson(response.data as Map<String, dynamic>)));
  // }
}

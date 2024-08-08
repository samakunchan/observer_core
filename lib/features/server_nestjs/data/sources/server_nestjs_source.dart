import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/dio.dart';

/// Class a instancier ou injecter dans un [GetIt] afin d'être utiliser <br>
/// Exemple:
/// ```dart
/// final sl = GetIt.instance;
/// sl.registerSingleton<AbstractApiRepository>(ApiRepository(apiSource: sl()));
/// ```
class ServerNestjsSource implements AbstractServerNestjsSource {
  ServerNestjsSource({required this.remoteService});

  final ServerNestjsService remoteService;

  /// Le service [ServerNestjsService] exécute les requêtes ['GET']
  @override
  Future<HttpResponse<dynamic>> get(GetParams params) async {
    try {
      switch (params.endPoint) {
        case MainProject.environmentsEndPoint:
        case '${MainProject.environmentsEndPoint}/all':
          return await remoteService.getEnvironments(
            authorization: 'Bearer ${params.accessToken}',
          );
        case MainProject.categoriesEndPoint:
        case '${MainProject.categoriesEndPoint}/all':
          return await remoteService.getCategories(
            authorization: 'Bearer ${params.accessToken}',
          );
        case '/articles':
        case '/articles/all':
          return await remoteService.getArticles(
            authorization: 'Bearer ${params.accessToken}',
          );
        case '/projects':
        case '/projects/all':
          return await remoteService.getProjects(
            authorization: 'Bearer ${params.accessToken}',
          );
        case '/organisations':
        case '/organisations/all':
          return await remoteService.getOrganisation(
            authorization: 'Bearer ${params.accessToken}',
          );
        case '/legals':
        case '/legals/all':
          return await remoteService.getLegals(
            authorization: 'Bearer ${params.accessToken}',
          );
        case '/documents':
        case '/documents/all':
          return await remoteService.getDocuments(
            authorization: 'Bearer ${params.accessToken}',
          );
        default:
          throw NotFoundException(httpError: HttpError.fromJson(HttpError.customNotFoundError));
      }
    } on DioException catch (e) {
      throw handleAllException(e);
    }
  }

  @override
  Future<HttpResponse<dynamic>> upsert(UpsertParams params) async {
    try {
      switch (params.endPoint) {
        case MainProject.environmentsEndPoint:
          return await remoteService.upsertEnvironment(
            authorization: 'Bearer ${params.accessToken}',
            contentType: MainProject.defaultContentType,
            body: params.body,
          );
        case MainProject.categoriesEndPoint:
          return await remoteService.upsertCategory(
            authorization: 'Bearer ${params.accessToken}',
            contentType: MainProject.defaultContentType,
            body: params.body,
          );
        default:
          throw NotFoundException(httpError: HttpError.fromJson(HttpError.customNotFoundError));
      }
    } on DioException catch (e) {
      throw handleAllException(e);
    }
  }

  @override
  Future<HttpResponse<dynamic>> delete(DeleteParams params) async {
    try {
      switch (params.endPoint) {
        case '/environments':
          return await remoteService.deleteEnvironment(
            authorization: 'Bearer ${params.accessToken}',
            contentType: MainProject.defaultContentType,
            body: params.body,
          );
        default:
          throw NotFoundException(httpError: HttpError.fromJson(HttpError.customNotFoundError));
      }
    } on DioException catch (e) {
      throw handleAllException(e);
    }
  }

  Exception handleAllException(DioException e) {
    final Map<String, dynamic> jsonError = e.response != null ? jsonDecode(e.response.toString()) as Map<String, dynamic> : {};
    final HttpError httpError = jsonError.isNotEmpty
        ? HttpError.fromJson({
            ...jsonError,
            'description': jsonError['description'].runtimeType == String ? jsonError['description'] : '',
          })
        : const HttpError();
    if (httpError.statusCode == 400) {
      throw BadRequestException(httpError: httpError);
    } else if (httpError.statusCode == 401) {
      throw UnAuthorizedException(httpError: httpError);
    } else if (httpError.statusCode == 403) {
      throw ForbiddenException(httpError: httpError);
    } else if (httpError.statusCode == 503) {
      throw ServerException();
    } else if (httpError.statusCode == 404) {
      throw NotFoundException(httpError: httpError);
    } else if (e is NotFoundException) {
      throw NotFoundException(httpError: httpError);
    } else if (e.toString().contains('Connection refused')) {
      throw ServerException();
    } else {
      throw IDontKnowWhatImDoingException();
    }
  }
}

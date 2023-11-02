import 'package:get_it/get_it.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Class a instancier ou injecter dans un [GetIt] afin d'être utiliser <br>
/// Exemple:
/// ```dart
/// final sl = GetIt.instance;
/// sl.registerSingleton<AbstractApiRepository>(ApiRepository(apiSource: sl()));
/// ```
class InMemorySource implements AbstractInMemorySource {
  InMemorySource({required this.secureStorage});

  final InMemoryService secureStorage;

  /// Le service [InMemoryService] exécute les requêtes ['GET']
  @override
  Future<HttpResponse<dynamic>> get(GetParams params) async {
    try {
      switch (params.endPoint) {
        case MainProject.environmentsEndPoint:
        case '${MainProject.environmentsEndPoint}/all':
          return await secureStorage.getEnvironments();
        default:
          throw const NotFoundException();
      }
    } catch (e) {
      if (e.toString().contains('401')) {
        throw const UnAuthorizedException();
      } else if (e.toString().contains('403')) {
        throw const ForbiddenException();
      } else if (e.toString().contains('503')) {
        throw ServerException();
      } else if (e is NotFoundException) {
        throw const NotFoundException();
      } else {
        throw IDontKnowWhatImDoingException();
      }
    }
  }

  /// Le service [InMemoryService] exécute les requêtes ['GET']
  @override
  Future<HttpResponse<dynamic>> post(UpsertParams params) async {
    try {
      switch (params.endPoint) {
        case MainProject.environmentsEndPoint:
          return await secureStorage.postEnvironments(body: params.body);
        default:
          throw const NotFoundException();
      }
    } catch (e) {
      if (e.toString().contains('401')) {
        throw const UnAuthorizedException();
      } else if (e.toString().contains('403')) {
        throw const ForbiddenException();
      } else if (e.toString().contains('503')) {
        throw ServerException();
      } else if (e is NotFoundException) {
        throw const NotFoundException();
      } else {
        throw IDontKnowWhatImDoingException();
      }
    }
  }
}

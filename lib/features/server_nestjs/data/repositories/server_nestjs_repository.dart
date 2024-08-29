import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Class a instancier ou injecter dans un [GetIt] afin d'être utiliser <br>
/// Exemple:
/// ```dart
/// final sl = GetIt.instance;
/// sl.registerSingleton<AbstractApiRepository>(ApiRepository(apiSource: sl()));
/// ```
class ServerNestjsRepository implements AbstractServerNestjsRepository {
  const ServerNestjsRepository({required this.remoteSource});
  final AbstractServerNestjsSource remoteSource;

  /// Grâce à la [BaseRepository] qui agit comme un layout pour les call API, on fait un call avec la méthode ['GET'] à l'[ServerNestjsSource]<br>
  /// A cette étape les données vont vers le [Bloc] ou les [Widget]
  @override
  Future<Either<Failure, HttpResponse<dynamic>>> getResponses(GetParams params) {
    return BaseRepository.requestRemoteApi<HttpResponse<dynamic>>(() => remoteSource.get(params));
  }

  @override
  Future<Either<Failure, HttpResponse<dynamic>>> upsertOne(UpsertParams params) {
    return BaseRepository.requestRemoteApi<HttpResponse<dynamic>>(() => remoteSource.upsert(params));
  }

  @override
  Future<Either<Failure, HttpResponse<dynamic>>> deleteOne(DeleteParams params) {
    return BaseRepository.requestRemoteApi<HttpResponse<dynamic>>(() => remoteSource.delete(params));
  }

  @override
  Future<Either<Failure, HttpResponse<dynamic>>> search(SearchParams params) {
    return BaseRepository.requestRemoteApi<HttpResponse<dynamic>>(() => remoteSource.search(params));
  }
}

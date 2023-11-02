import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Class a instancier ou injecter dans un [GetIt] afin d'être utiliser <br>
/// Exemple:
/// ```dart
/// final sl = GetIt.instance;
/// sl.registerSingleton<AbstractLocalRepository>(LocalRepository(localSource: sl()));
/// ```
class InMemoryRepository implements AbstractInMemoryRepository {
  const InMemoryRepository({required this.inMemorySource});
  final AbstractInMemorySource inMemorySource;

  /// Grâce à la [BaseRepository] qui agit comme un layout pour les call API, on fait un call avec la méthode ['GET'] à l'[AbstractInMemorySource]<br>
  /// A cette étape les données vont vers le [Bloc] ou les [Widget]
  @override
  Future<Either<Failure, HttpResponse<dynamic>>> getResponses(GetParams params) {
    return BaseRepository.requestInMemoryStorage<HttpResponse<dynamic>>(() => inMemorySource.get(params));
  }

  @override
  Future<Either<Failure, HttpResponse<dynamic>>> upsertResponses(UpsertParams params) {
    return BaseRepository.requestInMemoryStorage<HttpResponse<dynamic>>(() => inMemorySource.post(params));
  }
}

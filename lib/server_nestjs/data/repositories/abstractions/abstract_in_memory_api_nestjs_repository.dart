import 'package:dartz/dartz.dart';
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Détails des méthodes à implementer :
/// - getResponses(GetParams params)
abstract class AbstractInMemoryApiNestjsRepository {
  Future<Either<Failure, HttpResponse<dynamic>>> getResponses(GetParams params);
  Future<Either<Failure, HttpResponse<dynamic>>> upsertResponses(UpsertParams params);
}

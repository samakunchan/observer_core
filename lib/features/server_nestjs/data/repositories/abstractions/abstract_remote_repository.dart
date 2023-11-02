import 'package:dartz/dartz.dart';
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Détails des méthodes à implementer :
/// - getResponses(GetParams params)
abstract class AbstractServerNestjsRepository {
  Future<Either<Failure, HttpResponse<dynamic>>> getResponses(GetParams params);
  Future<Either<Failure, HttpResponse<dynamic>>> upsertOne(UpsertParams params);
  Future<Either<Failure, HttpResponse<dynamic>>> deleteOne(DeleteParams params);
}

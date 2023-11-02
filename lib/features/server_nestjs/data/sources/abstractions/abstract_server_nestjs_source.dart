import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Détails des méthodes à implementer :
/// - get(GetParams params)
abstract class AbstractServerNestjsSource {
  Future<HttpResponse<dynamic>> get(GetParams params);
  Future<HttpResponse<dynamic>> upsert(UpsertParams params);
  Future<HttpResponse<dynamic>> delete(DeleteParams params);
}

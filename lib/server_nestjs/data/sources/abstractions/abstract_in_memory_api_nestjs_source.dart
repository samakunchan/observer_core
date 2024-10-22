import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/dio.dart';

/// Détails des méthodes à implementer :
/// - get(GetParams params)
abstract class AbstractInMemoryApiNestjsSource {
  Future<HttpResponse<dynamic>> get(GetParams params);
  Future<HttpResponse<dynamic>> post(UpsertParams params);
  Future<HttpResponse<dynamic>> search(SearchParams params);
}

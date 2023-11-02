import 'package:get_it/get_it.dart';
import 'package:observer_core/features/server_nestjs/dependency_injection.dart' as dependency_injection;
import 'package:observer_core/features/server_nestjs/feature_server_nestjs_export.dart';

const String accessToken =
    'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI4N0U1MXNUazFmXzdQLWxQQ19CYk5mc2VzRERJTkpLVl9oOXFNNzluNmc0In0.eyJleHAiOjE2OTY1NTMwMTAsImlhdCI6MTY5NjU0NTgxMCwiYXV0aF90aW1lIjoxNjkyMDk3NzAwLCJqdGkiOiI3ZjFmNGZjOC03MjExLTRkNTktYjVkNC03ODQ2MDFjOTFhMGQiLCJpc3MiOiJodHRwczovL3NlY3VyZS1jb25uZWN0LmRldnBhcGFuZ3VlLmNvbS9yZWFsbXMvcHBnLWNvbm5lY3QiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiNzVhNTM0ZmMtNjYxNy00ODc3LWJjZTktMzY0OWJmNWQzOGU4IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoicGFwYW5ndWUiLCJzZXNzaW9uX3N0YXRlIjoiMWRjYzI4NDgtMGFlMS00OTg4LTk0NGEtNTU1MGFhODBhY2Y5IiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyIqIl0sInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJkZWZhdWx0LXJvbGVzLXBwZy1jb25uZWN0Iiwib2ZmbGluZV9hY2Nlc3MiLCJhZG1pbiIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiJvcGVuaWQgc2lyZW4gcHJvZmlsZSBlbWFpbCBvZmZsaW5lX2FjY2VzcyIsInNpZCI6IjFkY2MyODQ4LTBhZTEtNDk4OC05NDRhLTU1NTBhYTgwYWNmOSIsInNpcmVuIjoiODQyMTI3MjAxIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5hbWUiOiJDw6lkcmljIEJhZGphaCIsInByZWZlcnJlZF91c2VybmFtZSI6ImNlZHJpYy5iYWRqYWhAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6IkPDqWRyaWMiLCJmYW1pbHlfbmFtZSI6IkJhZGphaCIsImVtYWlsIjoiY2VkcmljLmJhZGphaEBnbWFpbC5jb20ifQ.Kq_ZtJ0RknP5456H6Cz7-85M2ZCOZF3zowPVNteHGYqJ7oTlFRM-l7-uxNgRsHhVT-1f8P_9iIW0ev7PtmxZMR-ZQgYlVA6XQcv9J2YxU39_M64o7TpG1JieJ5dEH3gjy7SULfBJpDdRiD5M3IBYr_afq0cVscihunggJIUjL86hIZd4u8NExXE799HahXTPbvSqNtOPj3xPIKNzpgZ8HRgtTmxHhFOgscjAxqrPJqP2R9f-YSxRp2HlUyxuv2npiTItBlyyy7KjcK958P6NGtdri-lLhMBdUZDOF-HBY4157OQFCY0Wh6sBrGPBD9wb9I_9wVp-EmwvgCJSiFTOmQ';

class ServerFeature {
  const ServerFeature._();

  static final GetIt sl = GetIt.instance;

  /// Pour récupérer les réponses:<br>
  /// Future<Either<Failure, HttpResponse<dynamic>>> getResponses(GetParams params);
  /// <br>-----<br><br>
  ///
  /// Pour ajouter et/ou mettre a jour un élément:<br>
  /// Future<Either<Failure, HttpResponse<dynamic>>> upsertResponses(UpsertParams params);<br>
  /// -----<br><br>
  static AbstractServerNestjsRepository get instanceOfPPGApiRepository => sl<AbstractServerNestjsRepository>();

  /// Pour récupérer les réponses:<br>
  /// Future<Either<Failure, HttpResponse<dynamic>>> getResponses(GetParams params);
  /// <br>-----<br><br>
  ///
  /// Pour ajouter et/ou mettre a jour un élément:<br>
  /// Future<Either<Failure, HttpResponse<dynamic>>> upsertResponses(UpsertParams params);
  /// <br>-----<br><br>
  static AbstractInMemoryRepository get instanceOfPPGLocalRepository => sl<AbstractInMemoryRepository>();

  static Future<void> initServerNestJs({required String wsBaseUrl}) async {
    await dependency_injection.initServerNestJs(wsBaseUrl: wsBaseUrl);
  }
}

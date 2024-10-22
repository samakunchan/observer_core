import 'package:get_it/get_it.dart';
import 'package:observer_core/features/authentication/dependency_injection.dart' as dependency_injection_token;
import 'package:observer_core/server_nestjs/dependency_injection.dart' as dependency_injection_server;
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';

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
  static AbstractInMemoryApiNestjsRepository get instanceOfPPGLocalRepository => sl<AbstractInMemoryApiNestjsRepository>();

  static Future<void> initServerNestJs({required String wsBaseUrl}) async {
    await dependency_injection_server.initServerNestJs(wsBaseUrl: wsBaseUrl);
    await dependency_injection_token.initAuthenticationManager();
  }
}

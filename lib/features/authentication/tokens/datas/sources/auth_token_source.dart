import 'package:observer_core/features/authentication/tokens/datas/models/models_export.dart';
import 'package:observer_core/features/authentication/tokens/datas/services/auth_token_service.dart';
import 'package:observer_core/features/authentication/tokens/datas/sources/abstractions/abstract_auth_token_source.dart';

class AuthTokenSource implements AbstractAuthTokenSource {
  AuthTokenSource({required this.authTokenService});
  final AuthTokenService authTokenService;

  @override
  Future<AuthTokenModel> getAuthToken() {
    return authTokenService.getAuthToken();
  }

  @override
  Future<void> postAuthToken(AuthTokenModel authToken) async {
    await authTokenService.storeAuthToken(authToken: authToken);
  }
}

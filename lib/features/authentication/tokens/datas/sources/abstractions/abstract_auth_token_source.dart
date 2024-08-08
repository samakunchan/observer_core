import 'dart:async';

import 'package:observer_core/features/authentication/tokens/datas/models/auth_token/auth_token_model.dart';

abstract class AbstractAuthTokenSource {
  Future<AuthTokenModel> getAuthToken();
  Future<void> postAuthToken(AuthTokenModel authToken);
}

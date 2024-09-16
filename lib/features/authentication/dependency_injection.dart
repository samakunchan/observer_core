import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:observer_core/features/authentication/feature_auth_export.dart';

Future<void> initAuthenticationManager() async {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  AuthenticationFeature.sl

    /// SERVICES
    ..registerSingleton<AuthTokenService>(AuthTokenService(secureStorage))
    ..registerSingleton<UserInfosService>(UserInfosService(secureStorage))

    /// SOURCES
    ..registerSingleton<AbstractAuthTokenSource>(AuthTokenSource(authTokenService: AuthenticationFeature.sl()))
    ..registerSingleton<AbstractUserInfosSource>(UserInfosSource(userInfosService: AuthenticationFeature.sl()));
}

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:observer_core/features/authentication/authentication_feature.dart';
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

// TODO Trouver des infos sur l'expiration du refresh token. A quel moment il n'est plus valide.
// TODO Faire le get profile user. (voir si le bouton pourrait aussi passer le profil user aussi).
// TODO Debugger la double auth sur keycloak. Utilise "event" pour record les processus d'authentification.

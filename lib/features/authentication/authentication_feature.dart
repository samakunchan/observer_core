import 'package:get_it/get_it.dart';
import 'package:observer_core/features/authentication/dependency_injection.dart' as dependency_injection_token;
import 'package:observer_core/features/authentication/feature_auth_export.dart';

class AuthenticationFeature {
  const AuthenticationFeature._();

  static final GetIt sl = GetIt.instance;

  static AbstractAuthTokenSource get instanceOfSecureStorageForToken => sl<AbstractAuthTokenSource>();
  static AbstractUserInfosSource get instanceOfSecureStorageForUserInfos => sl<AbstractUserInfosSource>();

  static Future<void> initAuthHandler() async {
    await dependency_injection_token.initAuthenticationManager();
  }
}

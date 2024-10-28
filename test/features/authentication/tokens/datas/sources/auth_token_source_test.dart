import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/features/features_export.dart';

import 'auth_token_source_test.mocks.dart';

@GenerateMocks([AuthTokenService])
void main() {
  late MockAuthTokenService mockAuthTokenService;
  late AuthTokenSource authTokenSource;
  final AuthTokenModel authTokenModel = AuthTokenModel.fromJson(
    <String, dynamic>{
      'access_token': 'access_token',
      'expires_in': 0,
      'refresh_token': 'refresh_token',
      'token_type': 'token_type',
      'id_token': 'id_token',
      'not-before-policy': 0,
      'session_state': 'session_state',
      'scope': 'scope',
    },
  );

  group('Given an instance of AuthTokenSource.', () {
    group('When the method getAuthToken() is called.', () {
      setUp(() {
        mockAuthTokenService = MockAuthTokenService();
        authTokenSource = AuthTokenSource(authTokenService: mockAuthTokenService);

        /// Arrange GET
        when(
          mockAuthTokenService.getAuthToken(),
        ).thenAnswer(
          (_) async => authTokenModel,
        );
      });

      test('Then it should delete an old data and store auth tokens to the storage.', () async {
        /// Act
        await authTokenSource.getAuthToken();

        /// Assert
        verify(mockAuthTokenService.getAuthToken());
        verifyNoMoreInteractions(mockAuthTokenService);
      });
    });

    group('When the method postAuthToken() is called.', () {
      setUp(() {
        mockAuthTokenService = MockAuthTokenService();
        authTokenSource = AuthTokenSource(authTokenService: mockAuthTokenService);

        /// Arrange POST
        when(
          mockAuthTokenService.storeAuthToken(authToken: authTokenModel),
        ).thenAnswer(
          (_) async => {},
        );
      });

      test('Then it should get the auth tokens from the storage', () async {
        /// Act
        await authTokenSource.postAuthToken(authTokenModel);

        /// Assert
        verify(mockAuthTokenService.storeAuthToken(authToken: authTokenModel));
        verifyNoMoreInteractions(mockAuthTokenService);
      });
    });
  });
}

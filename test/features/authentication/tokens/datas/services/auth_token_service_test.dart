import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/features/features_export.dart';

import 'auth_token_service_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late AuthTokenService authTokenService;
  late AuthTokenModel authTokenModel;

  const String testValueStorage = 'value';

  group('Given an instance of UserInfosService.', () {
    group('When an authentication is successful.', () {
      setUp(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        authTokenService = AuthTokenService(mockFlutterSecureStorage);
        authTokenModel = AuthTokenModel.fromJson(
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

        /// Arrange DELETE
        when(
          mockFlutterSecureStorage.delete(key: anyNamed('key')),
        ).thenAnswer(
          (_) async => {},
        );

        /// Arrange WRITE
        when(
          mockFlutterSecureStorage.write(
            key: anyNamed('key'),
            value: anyNamed('value'),
          ),
        ).thenAnswer(
          (_) async => {},
        );
      });

      test('Then it should delete an old data and store the user infos to the storage.', () async {
        /// Act
        await authTokenService.storeAuthToken(authToken: authTokenModel);

        /// Assert
        verifyInOrder(
          [
            mockFlutterSecureStorage.delete(key: anyNamed('key')),
            mockFlutterSecureStorage.write(
              key: anyNamed('key'),
              value: anyNamed(testValueStorage),
            ),
          ],
        );
        verifyNoMoreInteractions(mockFlutterSecureStorage);
      });
    });

    group('When a user is connected.', () {
      setUp(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        authTokenService = AuthTokenService(mockFlutterSecureStorage);
        authTokenModel = AuthTokenModel.fromJson(
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

        /// Arrange READ
        when(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        ).thenAnswer(
          (_) async => Future.value(jsonEncode(authTokenModel)),
        );
      });

      test('Then it should get the user from the storage', () async {
        /// Act
        final AbstractAuthTokenModel result = await authTokenService.getAuthToken();

        /// Assert
        verify(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        );
        expect(result, isA<AuthTokenModel>());
        expect(result.accessToken, authTokenModel.accessToken);
        expect(result.expiresIn, authTokenModel.expiresIn);
        expect(result.refreshToken, authTokenModel.refreshToken);
        expect(result.tokenType, authTokenModel.tokenType);
        expect(result.idToken, authTokenModel.idToken);
        expect(result.notBeforePolicy, authTokenModel.notBeforePolicy);
        expect(result.sessionState, authTokenModel.sessionState);
        expect(result.scope, authTokenModel.scope);
        verifyNoMoreInteractions(mockFlutterSecureStorage);
      });
    });

    group('When a user is not connected.', () {
      setUp(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        authTokenService = AuthTokenService(mockFlutterSecureStorage);

        /// Arrange READ
        when(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        ).thenAnswer(
          (_) async => null,
        );
      });

      test('Then it should get the fake user.', () async {
        /// Act
        final AbstractAuthTokenModel result = await authTokenService.getAuthToken();

        /// Assert
        verify(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        );

        expect(result, isA<AuthTokenModel>());
        expect(result.accessToken, FakeAuthTokenModel.example.accessToken);
        expect(result.expiresIn, FakeAuthTokenModel.example.expiresIn);
        expect(result.refreshToken, FakeAuthTokenModel.example.refreshToken);
        expect(result.tokenType, FakeAuthTokenModel.example.tokenType);
        expect(result.idToken, FakeAuthTokenModel.example.idToken);
        expect(result.notBeforePolicy, FakeAuthTokenModel.example.notBeforePolicy);
        expect(result.sessionState, FakeAuthTokenModel.example.sessionState);
        expect(result.scope, FakeAuthTokenModel.example.scope);
        verifyNoMoreInteractions(mockFlutterSecureStorage);
      });
    });
  });
}

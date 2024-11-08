import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/features/features_export.dart';

import 'user_infos_service_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage mockFlutterSecureStorage;
  late UserInfosService userInfosService;
  late UserInfosModel userInfosModel;

  const String testValueStorage = 'value';

  group('Given an instance of UserInfosService.', () {
    group('When an authentication is successful.', () {
      setUp(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        userInfosService = UserInfosService(mockFlutterSecureStorage);
        userInfosModel = UserInfosModel.fromJson(
          <String, dynamic>{
            'sub': 'sub',
            'siren': 'siren',
            'email_verified': true,
            'name': 'name',
            'preferred_username': 'preferredUsername',
            'locale': 'locale',
            'given_name': 'givenName',
            'family_name': 'familyName',
            'email': 'email',
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
        await userInfosService.storeUserInfos(userInfos: userInfosModel);

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
        userInfosService = UserInfosService(mockFlutterSecureStorage);
        userInfosModel = UserInfosModel.fromJson(
          <String, dynamic>{
            'sub': 'sub',
            'siren': 'siren',
            'email_verified': true,
            'name': 'name',
            'preferred_username': 'preferredUsername',
            'locale': 'locale',
            'given_name': 'givenName',
            'family_name': 'familyName',
            'email': 'email',
          },
        );

        /// Arrange READ
        when(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        ).thenAnswer(
          (_) async => Future.value(jsonEncode(userInfosModel)),
        );
      });

      test('Then it should get the user from the storage', () async {
        /// Act
        final AbstractUserInfosModel result = await userInfosService.getUserInfos();

        /// Assert
        verify(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        );
        expect(result, isA<UserInfosModel>());
        expect(result.sub, userInfosModel.sub);
        expect(result.siren, userInfosModel.siren);
        expect(result.email, userInfosModel.email);
        expect(result.emailVerified, userInfosModel.emailVerified);
        expect(result.name, userInfosModel.name);
        expect(result.preferredUsername, userInfosModel.preferredUsername);
        expect(result.locale, userInfosModel.locale);
        expect(result.givenName, userInfosModel.givenName);
        expect(result.familyName, userInfosModel.familyName);
        verifyNoMoreInteractions(mockFlutterSecureStorage);
      });
    });

    group('When a user is not connected.', () {
      setUp(() {
        mockFlutterSecureStorage = MockFlutterSecureStorage();
        userInfosService = UserInfosService(mockFlutterSecureStorage);

        /// Arrange READ
        when(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        ).thenAnswer(
          (_) async => null,
        );
      });

      test('Then it should get the fake user.', () async {
        /// Act
        final AbstractUserInfosModel result = await userInfosService.getUserInfos();

        /// Assert
        verify(
          mockFlutterSecureStorage.read(key: anyNamed('key')),
        );

        expect(result, isA<UserInfosModel>());
        expect(result.sub, FakeUserInfosModel.example.sub);
        expect(result.siren, FakeUserInfosModel.example.siren);
        expect(result.email, FakeUserInfosModel.example.email);
        expect(result.emailVerified, FakeUserInfosModel.example.emailVerified);
        expect(result.name, FakeUserInfosModel.example.name);
        expect(result.preferredUsername, FakeUserInfosModel.example.preferredUsername);
        expect(result.locale, FakeUserInfosModel.example.locale);
        expect(result.givenName, FakeUserInfosModel.example.givenName);
        expect(result.familyName, FakeUserInfosModel.example.familyName);
        verifyNoMoreInteractions(mockFlutterSecureStorage);
      });
    });
  });
}

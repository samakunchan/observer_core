import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/features/features_export.dart';

import 'user_infos_source_test.mocks.dart';

@GenerateMocks([UserInfosService])
void main() {
  late MockUserInfosService mockUserInfosService;
  late UserInfosSource userInfosSource;
  final UserInfosModel userInfosModel = UserInfosModel.fromJson(
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

  group('Given an instance of AuthTokenSource.', () {
    group('When the method getAuthToken() is called.', () {
      setUp(() {
        mockUserInfosService = MockUserInfosService();
        userInfosSource = UserInfosSource(userInfosService: mockUserInfosService);

        /// Arrange GET
        when(
          mockUserInfosService.getUserInfos(),
        ).thenAnswer(
          (_) async => userInfosModel,
        );
      });

      test('Then it should delete an old data and store the user infos to the storage.', () async {
        /// Act
        await userInfosSource.getUserInfos();

        /// Assert
        verify(mockUserInfosService.getUserInfos());
        verifyNoMoreInteractions(mockUserInfosService);
      });
    });

    group('When the method postAuthToken() is called.', () {
      setUp(() {
        mockUserInfosService = MockUserInfosService();
        userInfosSource = UserInfosSource(userInfosService: mockUserInfosService);

        /// Arrange POST
        when(
          mockUserInfosService.storeUserInfos(userInfos: userInfosModel),
        ).thenAnswer(
          (_) async => {},
        );
      });

      test('Then it should get the user from the storage', () async {
        /// Act
        await userInfosSource.postUserInfos(userInfosModel);

        /// Assert
        verify(mockUserInfosService.storeUserInfos(userInfos: userInfosModel));
        verifyNoMoreInteractions(mockUserInfosService);
      });
    });
  });
}

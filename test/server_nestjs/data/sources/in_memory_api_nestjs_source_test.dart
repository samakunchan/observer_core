import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/retrofit.dart';

import 'in_memory_api_nestjs_source_test.mocks.dart';

const List<Map<String, dynamic>> fakeResponse = [
  <String, dynamic>{
    'fake_id': 999,
    'fake_results': <List<dynamic>>[],
  }
];

const List<Map<String, dynamic>> fakeSearchResponse = [
  <String, dynamic>{
    'fake_results': <List<dynamic>>[],
  }
];
const String fakeBody = 'data-stringified';
@GenerateMocks([InMemoryApiNestjsService])
void main() {
  late MockInMemoryApiNestjsService mockSecureStorage;

  late InMemoryApiNestjsSource inMemorySource;

  setUp(() async {
    mockSecureStorage = MockInMemoryApiNestjsService();
    inMemorySource = InMemoryApiNestjsSource(secureStorage: mockSecureStorage);
  });

  group('Scenario of successful HTTP Request.', () {
    group('Given a random HTTP request.', () {
      /// GET
      group('When the server is offline and application is loading.', () {
        late HttpResponse<dynamic> response;
        late GetParams params;
        setUp(() async {
          /// Arrange
          when(mockSecureStorage.getEnvironments()).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );
        });

        test('Then it should perform a GET request on ${MainProject.environmentsEndPoint} and get datas from the storage.', () async {
          /// Act
          params = const GetParams(
            accessToken: 'accessToken',
            endPoint: MainProject.environmentsEndPoint,
          );
          response = await inMemorySource.get(params);

          /// Assert
          verify(mockSecureStorage.getEnvironments());
          verifyNoMoreInteractions(mockSecureStorage);
        });

        test('Then it should perform a GET request on ${MainProject.environmentsEndPoint} and get datas from the storage.', () async {
          /// Act
          params = const GetParams(
            accessToken: 'accessToken',
            endPoint: '${MainProject.environmentsEndPoint}/all',
          );
          response = await inMemorySource.get(params);

          /// Assert
          verify(mockSecureStorage.getEnvironments());
          verifyNoMoreInteractions(mockSecureStorage);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            params = const GetParams(accessToken: 'accessToken', endPoint: 'xxxx');
            await inMemorySource.get(params);
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });
      });

      /// POST
      group('When a form is submitted successfully.', () {
        late HttpResponse<dynamic> response;
        late UpsertParams params;
        setUp(() async {
          /// Arrange
          when(mockSecureStorage.postEnvironments(body: fakeBody)).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 201),
            ),
          );
        });

        test('Then it should perform a POST request on ${MainProject.environmentsEndPoint} and store datas to the storage.', () async {
          /// Act
          params = const UpsertParams(
            accessToken: 'accessToken',
            endPoint: MainProject.environmentsEndPoint,
            body: fakeBody,
          );
          response = await inMemorySource.post(params);

          /// Assert
          verify(mockSecureStorage.postEnvironments(body: fakeBody));
          verifyNoMoreInteractions(mockSecureStorage);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            params = const UpsertParams(
              accessToken: 'accessToken',
              endPoint: 'xxxx',
              body: fakeBody,
            );
            await inMemorySource.post(params);
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });
      });

      /// SEARCH
      group('When a form is search successfully.', () {
        late HttpResponse<dynamic> response;
        late SearchParams params;

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            params = const SearchParams(
              accessToken: 'accessToken',
              endPoint: 'xxxx',
              input: fakeBody,
            );
            await inMemorySource.search(params);
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });
      });
    });
  });

  group('Scenario of failure HTTP Request.', () {
    group('Given a random HTTP request.', () {
      /// GET
      group('When the application is loading.', () {
        group('When the server is offline and application is loading.', () {
          late HttpResponse<dynamic> response;
          late GetParams params;

          test('Then it should throw a ServerException.', () async {
            /// Arrange
            when(mockSecureStorage.getEnvironments()).thenThrow('503');
            try {
              /// Act
              params = const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.environmentsEndPoint,
              );
              await inMemorySource.get(params);
            } catch (e) {
              /// Assert
              expect(e, isA<ServerException>());
            }
          });
          test('Then it should throw a IDontKnowWhatImDoingException.', () async {
            /// Arrange
            when(mockSecureStorage.getEnvironments()).thenThrow('xxxx');
            try {
              /// Act
              params = const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.environmentsEndPoint,
              );
              await inMemorySource.get(params);
            } catch (e) {
              /// Assert
              expect(e, isA<IDontKnowWhatImDoingException>());
            }
          });
        });
      });

      /// POST
      group('When the server is offline and a form is submitting.', () {
        late HttpResponse<dynamic> response;
        late UpsertParams params;

        test('Then it should throw a ServerException.', () async {
          /// Arrange
          when(mockSecureStorage.postEnvironments(body: fakeBody)).thenThrow('503');
          try {
            /// Act
            params = const UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.environmentsEndPoint,
              body: fakeBody,
            );
            await inMemorySource.post(params);
          } catch (e) {
            /// Assert
            expect(e, isA<ServerException>());
          }
        });
        test('Then it should throw a IDontKnowWhatImDoingException.', () async {
          /// Arrange
          when(mockSecureStorage.getEnvironments()).thenThrow('xxxx');
          try {
            /// Act
            params = const UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.environmentsEndPoint,
              body: fakeBody,
            );
            await inMemorySource.post(params);
          } catch (e) {
            /// Assert
            expect(e, isA<IDontKnowWhatImDoingException>());
          }
        });
      });

      /// SEARCH
      group('When the server is offline and a query form is detected.', () {
        late HttpResponse<dynamic> response;
        late SearchParams params;

        test('Then it should throw a IDontKnowWhatImDoingException.', () async {
          /// Arrange
          when(mockSecureStorage.searchEnvironments(body: fakeBody)).thenThrow('xxxx');
          try {
            /// Act
            params = const SearchParams(
              accessToken: 'accessToken',
              endPoint: MainProject.environmentsSearchEndPoint,
              input: fakeBody,
            );
            await inMemorySource.search(params);
          } catch (e) {
            /// Assert
            expect(e, isA<IDontKnowWhatImDoingException>());
          }
        });
      });
    });
  });
}

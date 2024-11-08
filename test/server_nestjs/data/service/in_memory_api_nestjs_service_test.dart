import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';

import 'in_memory_api_nestjs_service_test.mocks.dart';

const String fakeBaseUrl = '/fake-base-url';

@GenerateMocks([FlutterSecureStorage])
void main() {
  final MockFlutterSecureStorage mockStorage = MockFlutterSecureStorage();
  final InMemoryApiNestjsService service = InMemoryApiNestjsService(mockStorage, baseUrl: fakeBaseUrl);

  GetIt.instance.registerSingleton<InMemoryApiNestjsService>(service);

  when(mockStorage.read(key: anyNamed('key'))).thenAnswer(
    (_) async => '[{"title": "fake-title"}]',
  );

  when(mockStorage.delete(key: anyNamed('key'))).thenAnswer(
    (_) async => {},
  );

  when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value'))).thenAnswer(
    (_) async => '[{"title": "fake-title"}]',
  );

  group('Given ServerNestJsService.', () {
    /// GET - DATAS
    group('Given a GET request', () {
      /// GET - ENV
      group('When getEnvironments() method is detected.', () {
        test('Then it should make an HTTP request to home collection.', () async {
          await InMemoryApiNestjsService(mockStorage).getEnvironments();

          verify(mockStorage.read(key: anyNamed('key')));
        });
      });
    });

    /// GET - SEARCH
    group('Given a GET request', () {
      /// GET - ENV
      group('When searchEnvironments() method is detected.', () {
        test('Then it should make an HTTP request to environments collections.', () async {
          await InMemoryApiNestjsService(mockStorage).searchEnvironments(body: '');
          await InMemoryApiNestjsService(mockStorage).searchStrictEnvironments(body: '');

          verify(mockStorage.read(key: anyNamed('key')));
        });
      });
    });

    /// POST
    group('Given a POST request', () {
      /// POST - ENV
      group('When postEnvironments() method is detected.', () {
        test('Then it should make an HTTP request to environments collections.', () async {
          await InMemoryApiNestjsService(mockStorage).postEnvironments(
            body: '',
          );

          verify(mockStorage.delete(key: anyNamed('key')));
          verify(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')));
        });
      });
    });
  });
}

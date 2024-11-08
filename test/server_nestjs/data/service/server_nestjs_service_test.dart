import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/server_nestjs/data/features_server_nestjs_data_export.dart';

import 'server_nestjs_service_test.mocks.dart';

const List<Map<String, dynamic>> fakeResponse = [
  <String, dynamic>{
    'fake_id': 999,
    'fake_results': <List<dynamic>>[],
  }
];

const String fakeBaseUrl = '/fake-base-url';

@GenerateMocks([Dio])
void main() {
  final MockDio mockDio = MockDio();
  final ServerNestjsService service = ServerNestjsService(mockDio, baseUrl: fakeBaseUrl);

  GetIt.instance.registerSingleton<ServerNestjsService>(service);

  when(mockDio.options).thenReturn(BaseOptions());

  /// Arrange token

  group('Given ServerNestJsService.', () {
    setUp(() {
      when(mockDio.fetch<dynamic>(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: fakeBaseUrl),
          statusCode: 200,
          data: {'message': 'Hello World'},
        ),
      );
    });

    /// GET - DATAS
    group('Given a GET request', () {
      /// GET - HOME
      group('When getHome() method is detected.', () {
        test('Then it should make an HTTP request to home collection.', () async {
          await ServerNestjsService(mockDio).getHome();

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - ENV
      group('When getEnvironments() method is detected.', () {
        test('Then it should make an HTTP request to environments collections.', () async {
          await ServerNestjsService(mockDio).getEnvironments(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - CATEGORIES
      group('When getCategories() method is detected.', () {
        test('Then it should make an HTTP request to categories collections.', () async {
          await ServerNestjsService(mockDio).getCategories(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - PROJECTS
      group('When getProjects() method is detected.', () {
        test('Then it should make an HTTP request to projects collections.', () async {
          await ServerNestjsService(mockDio).getProjects(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - ORGANISATION
      group('When getOrganisation() method is detected.', () {
        test('Then it should make an HTTP request to organisation collections.', () async {
          await ServerNestjsService(mockDio).getOrganisation(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - LEGALS
      group('When getLegals() method is detected.', () {
        test('Then it should make an HTTP request to legals collections.', () async {
          await ServerNestjsService(mockDio).getLegals(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - DOCUMENTS
      group('When getDocuments() method is detected.', () {
        test('Then it should make an HTTP request to documents collections.', () async {
          await ServerNestjsService(mockDio).getDocuments(authorization: 'authorization');
          await ServerNestjsService(mockDio).getDocumentsFilteredBy(
            authorization: 'authorization',
            folder: 'docs',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - SERVICES
      group('When getProposedServices() method is detected.', () {
        test('Then it should make an HTTP request to proposed service collections.', () async {
          await ServerNestjsService(mockDio).getProposedServices(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - SKILLS
      group('When getSkills() method is detected.', () {
        test('Then it should make an HTTP request to skills collections.', () async {
          await ServerNestjsService(mockDio).getSkills(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - REASONS
      group('When getReasons() method is detected.', () {
        test('Then it should make an HTTP request to reasons collections.', () async {
          await ServerNestjsService(mockDio).getReasons(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - ABOUT ME
      group('When getDatasAboutMe() method is detected.', () {
        test('Then it should make an HTTP request to about me collections.', () async {
          await ServerNestjsService(mockDio).getDatasAboutMe(authorization: 'authorization');

          verify(mockDio.fetch<dynamic>(any));
        });
      });
    });

    /// GET - SEARCH
    group('Given a GET request', () {
      /// GET - ENV
      group('When searchEnvironments() method is detected.', () {
        test('Then it should make an HTTP request to environments collections.', () async {
          await ServerNestjsService(mockDio).searchEnvironments(
            authorization: 'authorization',
            contentType: '',
          );
          await ServerNestjsService(mockDio).searchStrictEnvironments(
            authorization: 'authorization',
            contentType: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// GET - CATEGORIES
      group('When searchCategories() method is detected.', () {
        test('Then it should make an HTTP request to categories collections.', () async {
          await ServerNestjsService(mockDio).searchCategories(
            authorization: 'authorization',
            contentType: '',
          );
          await ServerNestjsService(mockDio).searchStrictCategories(
            authorization: 'authorization',
            contentType: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });
    });

    /// POST
    group('Given a POST request', () {
      /// POST - ENV
      group('When getEnvironments() method is detected.', () {
        test('Then it should make an HTTP request to environments collections.', () async {
          await ServerNestjsService(mockDio).upsertEnvironment(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - CATEGORIES
      group('When upsertCategory() method is detected.', () {
        test('Then it should make an HTTP request to categories collections.', () async {
          await ServerNestjsService(mockDio).upsertCategory(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - PROJECTS
      group('When upsertProject() method is detected.', () {
        test('Then it should make an HTTP request to projects collections.', () async {
          await ServerNestjsService(mockDio).upsertProject(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - DOCUMENTS
      group('When upsertOneDocument() method is detected.', () {
        test('Then it should make an HTTP request to documents collections.', () async {
          await ServerNestjsService(mockDio).upsertOneDocument(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );
          await ServerNestjsService(mockDio).uploadOneDocument(
            authorization: 'authorization',
            formData: FormData(),
          );

          await ServerNestjsService(mockDio).uploadMultipleDocuments(
            authorization: 'authorization',
            formData: FormData(),
          );
          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - SERVICES
      group('When upsertOneService() method is detected.', () {
        test('Then it should make an HTTP request to proposed service collections.', () async {
          await ServerNestjsService(mockDio).upsertOneService(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - SKILLS
      group('When upsertOneSkill() method is detected.', () {
        test('Then it should make an HTTP request to skills collections.', () async {
          await ServerNestjsService(mockDio).upsertOneSkill(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - REASONS
      group('When upsertOneReason() method is detected.', () {
        test('Then it should make an HTTP request to reasons collections.', () async {
          await ServerNestjsService(mockDio).upsertOneReason(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// POST - ABOUT ME
      group('When upsertAbouts() method is detected.', () {
        test('Then it should make an HTTP request to about me collections.', () async {
          await ServerNestjsService(mockDio).upsertAbouts(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });
    });

    /// DELETE
    group('Given a POST request', () {
      /// DELETE - ENV
      group('When deleteEnvironment() method is detected.', () {
        test('Then it should make an HTTP request to environments collections.', () async {
          await ServerNestjsService(mockDio).deleteEnvironment(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// DELETE - CATEGORIES
      group('When deleteCategory() method is detected.', () {
        test('Then it should make an HTTP request to categories collections.', () async {
          await ServerNestjsService(mockDio).deleteCategory(
            authorization: 'authorization',
            contentType: '',
            body: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// DELETE - PROJECTS
      group('When deleteProject() method is detected.', () {
        test('Then it should make an HTTP request to projects collections.', () async {
          await ServerNestjsService(mockDio).deleteProject(
            authorization: 'authorization',
            contentType: '',
            id: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// DELETE - DOCUMENTS
      group('When deleteOneDocument() method is detected.', () {
        test('Then it should make an HTTP request to documents collections.', () async {
          await ServerNestjsService(mockDio).deleteOneDocument(
            authorization: 'authorization',
            contentType: '',
            id: '',
          );
          await ServerNestjsService(mockDio).deleteMultipleDocuments(
            authorization: 'authorization',
            body: '',
            contentType: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// DELETE - SERVICES
      group('When deleteOneService() method is detected.', () {
        test('Then it should make an HTTP request to proposed service collections.', () async {
          await ServerNestjsService(mockDio).deleteOneService(
            authorization: 'authorization',
            contentType: '',
            id: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// DELETE - SKILLS
      group('When deleteOneSkill() method is detected.', () {
        test('Then it should make an HTTP request to skills collections.', () async {
          await ServerNestjsService(mockDio).deleteOneSkill(
            authorization: 'authorization',
            contentType: '',
            id: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });

      /// DELETE - REASONS
      group('When deleteOneReason() method is detected.', () {
        test('Then it should make an HTTP request to reasons collections.', () async {
          await ServerNestjsService(mockDio).deleteOneReason(
            authorization: 'authorization',
            contentType: '',
            id: '',
          );

          verify(mockDio.fetch<dynamic>(any));
        });
      });
    });
  });
}

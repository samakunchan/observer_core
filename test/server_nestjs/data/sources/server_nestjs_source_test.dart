import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/enums/document_filtered_type_enum.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:retrofit/dio.dart';

import '../fake_datas.dart';
import 'server_nestjs_source_test.mocks.dart';

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

@GenerateMocks([ServerNestjsService])
void main() {
  late MockServerNestjsService mockService;

  late ServerNestjsSource source;

  setUp(() async {
    mockService = MockServerNestjsService();
    source = ServerNestjsSource(remoteService: mockService);
  });

  group('Scenario of successful HTTP Request.', () {
    group('Given a random HTTP request.', () {
      /// GET
      group('When the application is loading.', () {
        late HttpResponse<dynamic> response;
        late GetParams params;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(mockService.getEnvironments(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getCategories(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getProjects(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getOrganisation(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getLegals(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getProposedServices(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getSkills(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getReasons(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          when(mockService.getDatasAboutMe(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );
        });

        test('Then it should perform a GET request on ${MainProject.environmentsEndPoint}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.environmentsEndPoint);
          response = await source.get(params);

          /// Assert
          verify(mockService.getEnvironments(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.categoriesEndPoint}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.categoriesEndPoint);
          response = await source.get(params);

          /// Assert
          verify(mockService.getCategories(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.projectsEndPoint}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.projectsEndPoint);
          response = await source.get(params);

          /// Assert
          verify(mockService.getProjects(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.organisationsEndPoint}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.organisationsEndPoint);
          response = await source.get(params);

          /// Assert
          verify(mockService.getOrganisation(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.legalsEndPoint}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.legalsEndPoint);
          response = await source.get(params);

          /// Assert
          verify(mockService.getLegals(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.documentsEndPoint}', () async {
          /// Arrange
          when(mockService.getDocuments(authorization: anyNamed('authorization'))).thenAnswer(
            (_) async => HttpResponse(
              fakeResponse,
              Response(requestOptions: RequestOptions(), statusCode: 200),
            ),
          );

          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.documentsEndPoint);
          response = await source.get(params);

          /// Assert
          verify(mockService.getDocuments(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.documentsEndPoint}', () async {
          /// Arrange
          when(
            mockService.getDocumentsFilteredBy(
              authorization: anyNamed('authorization'),
              folder: anyNamed('folder'),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse, Response(requestOptions: RequestOptions(), statusCode: 200)),
          );

          /// Act
          params = const GetParams(
            accessToken: 'accessToken',
            endPoint: MainProject.documentsEndPoint,
            filteredBy: DocumentFilteredType.docs,
          );
          response = await source.get(params);

          /// Assert
          verify(
            mockService.getDocumentsFilteredBy(
              authorization: anyNamed('authorization'),
              folder: anyNamed('folder'),
            ),
          );
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.services}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.services);
          response = await source.get(params);

          /// Assert
          verify(mockService.getProposedServices(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.skills}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.skills);
          response = await source.get(params);

          /// Assert
          verify(mockService.getSkills(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.reasons}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.reasons);
          response = await source.get(params);

          /// Assert
          verify(mockService.getReasons(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.aboutme}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: MainProject.aboutme);
          response = await source.get(params);

          /// Assert
          verify(mockService.getDatasAboutMe(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should perform a GET request on ${MainProject.aboutme}', () async {
          /// Act
          params = const GetParams(accessToken: 'accessToken', endPoint: '${MainProject.aboutme}/all');
          response = await source.get(params);

          /// Assert
          verify(mockService.getDatasAboutMe(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            params = const GetParams(accessToken: 'accessToken', endPoint: 'xxxx');
            await source.get(params);
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });

        test('Then it should have a status code equal to 200', () async {
          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should return array of datas', () async {
          /// Assert
          expect(fakeResponse, isA<List<Map<String, dynamic>>>());
          expect(fakeResponse, response.data);
        });
      });

      /// POST
      group('When a form is submitted successfully', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.upsertEnvironment(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          when(
            mockService.upsertCategory(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          when(
            mockService.upsertProject(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          // when(
          //   mockService.upsertOrganisation(
          //     authorization: anyNamed('authorization'),
          //     contentType: MainProject.defaultContentType,
          //     body: jsonEncode(fakeResponse.first),
          //   ),
          // ).thenAnswer(
          //       (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          // );

          when(
            mockService.upsertOneDocument(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          when(
            mockService.upsertOneService(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          when(
            mockService.upsertOneSkill(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          when(
            mockService.upsertOneReason(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );

          when(
            mockService.upsertAbouts(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(fakeResponse.first, Response(requestOptions: RequestOptions(), statusCode: 201)),
          );
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.environmentsEndPoint,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.categoriesEndPoint,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.projectsEndPoint,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.documentsEndPoint,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.services,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.skills,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.reasons,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.aboutme,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: '${MainProject.aboutme}/all',
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            response = await source.upsert(
              UpsertParams(
                accessToken: 'accessToken',
                endPoint: 'unexpected_endpoint',
                body: jsonEncode(fakeResponse.first),
              ),
            );
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });

        test('Then it should return one of project', () async {
          /// Assert
          expect(fakeResponse.first, response.data);
        });
      });

      /// DELETE
      group('When an element is deleted successfully', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.deleteEnvironment(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), body: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteCategory(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), body: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteProject(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), id: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteOneDocument(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), id: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteMultipleDocuments(
              contentType: MainProject.defaultContentType,
              authorization: anyNamed('authorization'),
              body: '1',
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteOneService(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), id: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteOneSkill(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), id: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );

          when(
            mockService.deleteOneReason(contentType: MainProject.defaultContentType, authorization: anyNamed('authorization'), id: '1'),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(requestOptions: RequestOptions(path: MainProject.projectsEndPoint), statusCode: 200),
            ),
          );
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.environmentsEndPoint, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.categoriesEndPoint, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.projectsEndPoint, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.projectsEndPoint, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.documentsEndPoint, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.documentsMultiDeleteEndPoint, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.services, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(accessToken: 'accessToken', endPoint: MainProject.skills, body: '1'),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.delete(
            const DeleteParams(
              accessToken: 'accessToken',
              endPoint: MainProject.reasons,
              body: '1',
            ),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should delete one of project', () async {
          /// Assert
          expect(fakeDeleteResponse, response.data);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            response = await source.delete(
              const DeleteParams(
                accessToken: 'accessToken',
                endPoint: 'unexpected_endpoint',
                body: '1',
              ),
            );
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });
      });

      /// UPLOAD
      group('When documents are uploaded', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.uploadOneDocument(
              authorization: anyNamed('authorization'),
              formData: anyNamed('formData'),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              [''],
              Response(
                requestOptions: RequestOptions(
                  path: MainProject.documentsUploadEndPoint,
                ),
                statusCode: 201,
              ),
            ),
          );

          when(
            mockService.uploadMultipleDocuments(
              authorization: anyNamed('authorization'),
              formData: anyNamed('formData'),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              [''],
              Response(
                requestOptions: RequestOptions(
                  path: MainProject.documentsMultiUploadEndPoint,
                ),
                statusCode: 201,
              ),
            ),
          );
        });

        test('Then it should have a status code equal to 201', () async {
          /// Act
          response = await source.uploadFile(
            UploadFormDataParams(
              accessToken: 'accessToken',
              endPoint: MainProject.documentsUploadEndPoint,
              formData: FormData(),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.uploadFile(
            UploadFormDataParams(
              accessToken: 'accessToken',
              endPoint: MainProject.documentsMultiUploadEndPoint,
              formData: FormData(),
            ),
          );

          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should return one of project', () async {
          /// Assert
          expect([''], response.data);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            response = await source.uploadFile(
              UploadFormDataParams(
                accessToken: 'accessToken',
                endPoint: 'unexpected_endpoint',
                formData: FormData(),
              ),
            );
          } catch (e) {
            /// Assert
            expect(e, isA<NotFoundException>());
          }
        });
      });

      /// SEARCH
      group('When an element is search', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.searchEnvironments(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              input: 'fake-search',
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              [fakeSearchResponse],
              Response(
                requestOptions: RequestOptions(
                  path: MainProject.environmentsEndPoint,
                  data: [fakeSearchResponse],
                ),
                statusCode: 200,
              ),
            ),
          );

          when(
            mockService.searchStrictEnvironments(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              input: 'fake-search',
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              [fakeSearchResponse],
              Response(
                requestOptions: RequestOptions(
                  path: MainProject.environmentsEndPoint,
                  data: [fakeSearchResponse],
                ),
                statusCode: 200,
              ),
            ),
          );
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.search(
            const SearchParams(
              accessToken: 'accessToken',
              endPoint: '${MainProject.environmentsEndPoint}/search',
              input: 'fake-search',
            ),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Act
          response = await source.search(
            const SearchParams(
              accessToken: 'accessToken',
              endPoint: '${MainProject.environmentsEndPoint}/search',
              input: 'fake-search',
              strictMode: true,
            ),
          );

          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should throw a NotFoundException with an unexpected route', () async {
          try {
            /// Act
            response = await source.search(
              const SearchParams(
                accessToken: 'accessToken',
                endPoint: 'unexpected_endpoint',
                input: 'fake-search',
                strictMode: true,
              ),
            );
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
      group('When the application is loading', () {
        /// ROUTE NOT FOUND 1
        group('and there is no matched route.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail 404 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.badResponse,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(
                    path: MainProject.projectsEndPoint,
                  ),
                  data: error404,
                ),
                message: 'The request returned an invalid status code of 404.',
              ),
            );
          });

          test('Then it should thrown a NotFoundException', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<NotFoundException>()),
            );
          });
        });

        /// ROUTE NOT FOUND 2
        group('and there is no matched route.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail 404 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              const NotFoundException(),
            );
          });

          test('Then it should thrown a NotFoundException', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<NotFoundException>()),
            );
          });
        });

        /// UNAUTHORIZED
        group('and the user is not connected.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail 401 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.badResponse,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(
                    path: MainProject.projectsEndPoint,
                  ),
                  data: error401,
                ),
                message: 'The request returned an invalid status code of 401.',
              ),
            );
          });

          test('Then it should thrown an UnAuthorizedException.', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<UnAuthorizedException>()),
            );

            expect(
              const UnAuthorizedException().httpError.toJson(),
              isA<Map<String, dynamic>>(),
            );
          });
        });

        /// FORBIDDEN
        group('and the user has forbidden actions.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail 403 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.badResponse,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(
                    path: MainProject.projectsEndPoint,
                  ),
                  data: error403,
                ),
                message: 'The request returned an invalid status code of 403.',
              ),
            );
          });

          test('Then it should thrown an UnAuthorizedException.', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<ForbiddenException>()),
            );
          });
        });

        /// SERVER OFFLINE
        group('and the server is not responding.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail 503 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.connectionError,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(
                    path: MainProject.projectsEndPoint,
                  ),
                  data: error503,
                ),
                message: 'The request returned an invalid status code of 503.',
              ),
            );
          });
          test('Then it should thrown an ServerException.', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<ServerException>()),
            );
          });
        });
        group('and the server is not responding.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up error server
          setUp(() async {
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.connectionError,
                requestOptions: RequestOptions(),
                message: error503Message,
              ),
            );
          });

          test('Then it should thrown an ServerException.', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<ServerException>()),
            );
          });
        });

        /// BAD REQUEST
        group('and there is any bad action.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail 403 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.badResponse,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(
                    path: MainProject.projectsEndPoint,
                  ),
                  data: error400,
                ),
                message: 'The request returned an invalid status code of 400.',
              ),
            );
          });

          test('Then it should thrown an BadRequestException.', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<BadRequestException>()),
            );
          });
        });

        /// UNEXPECTED ERROR
        group('and there an expected error.', () {
          late Future<HttpResponse<dynamic>> response;

          /// Set up fail request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              DioException(
                type: DioExceptionType.badResponse,
                requestOptions: RequestOptions(),
                response: Response(
                  requestOptions: RequestOptions(
                    path: MainProject.projectsEndPoint,
                  ),
                  data: <String, dynamic>{
                    'statusCode': 999,
                  },
                ),
                message: 'The request returned an invalid status code of 400.',
              ),
            );
          });

          test('Then it should thrown an IDontKnowWhatImDoingException.', () async {
            /// Act
            response = source.get(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: MainProject.projectsEndPoint,
              ),
            );

            /// Assert
            await expectLater(
              response,
              throwsA(isA<IDontKnowWhatImDoingException>()),
            );
          });
        });
      });

      /// POST
      group('and the user is not connected.', () {
        late Future<HttpResponse<dynamic>> response;

        /// Set up fail 401 request
        setUp(() async {
          /// Arrange
          when(
            mockService.upsertProject(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeResponse.first),
            ),
          ).thenThrow(
            DioException(
              type: DioExceptionType.badResponse,
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(
                  path: MainProject.projectsEndPoint,
                ),
                data: error401,
              ),
              message: 'The request returned an invalid status code of 401.',
            ),
          );
        });

        /// UNAUTHORIZED
        test('Then it should thrown an UnAuthorizedException.', () async {
          /// Act
          response = source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.projectsEndPoint,
              body: jsonEncode(fakeResponse.first),
            ),
          );

          /// Assert
          await expectLater(
            response,
            throwsA(isA<UnAuthorizedException>()),
          );

          expect(
            const UnAuthorizedException().httpError.toJson(),
            isA<Map<String, dynamic>>(),
          );
        });
      });

      /// DELETE
      group('and the user is not connected.', () {
        late Future<HttpResponse<dynamic>> response;

        /// Set up fail 401 request
        setUp(() async {
          /// Arrange
          when(
            mockService.deleteEnvironment(
              contentType: MainProject.defaultContentType,
              authorization: anyNamed('authorization'),
              body: '1',
            ),
          ).thenThrow(
            DioException(
              type: DioExceptionType.badResponse,
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(
                  path: MainProject.environmentsEndPoint,
                ),
                data: error401,
              ),
              message: 'The request returned an invalid status code of 401.',
            ),
          );
        });

        /// UNAUTHORIZED
        test('Then it should thrown an UnAuthorizedException.', () async {
          /// Act
          response = source.delete(
            const DeleteParams(
              accessToken: 'accessToken',
              endPoint: MainProject.environmentsEndPoint,
              body: '1',
            ),
          );

          /// Assert
          await expectLater(
            response,
            throwsA(isA<UnAuthorizedException>()),
          );

          expect(
            const UnAuthorizedException().httpError.toJson(),
            isA<Map<String, dynamic>>(),
          );
        });
      });

      /// SEARCH
      group('and the user is not connected.', () {
        late Future<HttpResponse<dynamic>> response;

        /// Set up fail 401 request
        setUp(() async {
          /// Arrange
          when(
            mockService.searchEnvironments(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              input: 'fake-search',
            ),
          ).thenThrow(
            DioException(
              type: DioExceptionType.badResponse,
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(
                  path: MainProject.projectsEndPoint,
                ),
                data: error401,
              ),
              message: 'The request returned an invalid status code of 401.',
            ),
          );
        });

        /// UNAUTHORIZED
        test('Then it should thrown an UnAuthorizedException.', () async {
          /// Act
          response = source.search(
            const SearchParams(
              accessToken: 'accessToken',
              endPoint: '${MainProject.environmentsEndPoint}/search',
              input: 'fake-search',
            ),
          );

          /// Assert
          await expectLater(
            response,
            throwsA(isA<UnAuthorizedException>()),
          );

          expect(
            const UnAuthorizedException().httpError.toJson(),
            isA<Map<String, dynamic>>(),
          );
        });
      });

      /// UPLOAD
      group('and the user is not connected.', () {
        late Future<HttpResponse<dynamic>> response;

        /// Set up fail 401 request
        setUp(() async {
          /// Arrange
          when(
            mockService.uploadOneDocument(
              authorization: anyNamed('authorization'),
              formData: anyNamed('formData'),
            ),
          ).thenThrow(
            DioException(
              type: DioExceptionType.badResponse,
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(
                  path: MainProject.projectsEndPoint,
                ),
                data: error401,
              ),
              message: 'The request returned an invalid status code of 401.',
            ),
          );
        });

        /// UNAUTHORIZED
        test('Then it should thrown an UnAuthorizedException.', () async {
          /// Act
          response = source.uploadFile(
            UploadFormDataParams(
              accessToken: 'accessToken',
              endPoint: MainProject.documentsUploadEndPoint,
              formData: FormData(),
            ),
          );

          /// Assert
          await expectLater(
            response,
            throwsA(isA<UnAuthorizedException>()),
          );

          expect(
            const UnAuthorizedException().httpError.toJson(),
            isA<Map<String, dynamic>>(),
          );
        });
      });
    });
  });
}

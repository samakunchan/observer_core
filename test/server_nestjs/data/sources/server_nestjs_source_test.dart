import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:retrofit/dio.dart';

import '../fake_datas.dart';
import 'server_nestjs_source_test.mocks.dart';

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
      group('When the application is loading.', () {
        late HttpResponse<dynamic> response;
        late GetParams params;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.getProjects(authorization: anyNamed('authorization')),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDatasProjects,
              Response(
                requestOptions: RequestOptions(),
                statusCode: 200,
              ),
            ),
          );

          /// Act
          params = const GetParams(
            accessToken: 'accessToken',
            endPoint: MainProject.projectsEndPoint,
          );
          response = await source.get(params);
        });

        test('Then it should perform a GET request on /projects', () async {
          /// Assert
          verify(mockService.getProjects(authorization: anyNamed('authorization')));
          verifyNoMoreInteractions(mockService);
        });

        test('Then it should have a status code equal to 200', () async {
          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should return array of projects', () async {
          /// Assert
          expect(fakeDatasProjects, response.data);
        });
      });

      group('When a form is submitted successfully', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.upsertProject(
              authorization: anyNamed('authorization'),
              contentType: MainProject.defaultContentType,
              body: jsonEncode(fakeDatasProjects.first),
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDatasProjects.first,
              Response(
                requestOptions: RequestOptions(),
                statusCode: 201,
              ),
            ),
          );

          /// Act
          response = await source.upsert(
            UpsertParams(
              accessToken: 'accessToken',
              endPoint: MainProject.projectsEndPoint,
              body: jsonEncode(fakeDatasProjects.first),
            ),
          );
        });

        test('Then it should have a status code equal to 201', () async {
          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should return one of project', () async {
          /// Assert
          expect(fakeDatasProjects.first, response.data);
        });
      });

      group('When an element is deleted successfully', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
          when(
            mockService.deleteProject(
              contentType: MainProject.defaultContentType,
              authorization: anyNamed('authorization'),
              id: '1',
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(
                requestOptions: RequestOptions(
                  path: MainProject.projectsEndPoint,
                ),
                statusCode: 200,
              ),
            ),
          );

          /// Act
          response = await source.delete(
            const DeleteParams(
              accessToken: 'accessToken',
              endPoint: MainProject.projectsEndPoint,
              body: '1',
            ),
          );
        });

        test('Then it should have a status code equal to 200', () async {
          /// Assert
          expect(200, response.response.statusCode);
        });

        test('Then it should return one of project', () async {
          /// Assert
          expect(fakeDeleteResponse, response.data);
        });
      });

      group('When documents are uploaded', () {
        late HttpResponse<dynamic> response;

        /// Set up successful request
        setUp(() async {
          /// Arrange
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

          /// Act
          response = await source.uploadFile(
            UploadFormDataParams(
              accessToken: 'accessToken',
              endPoint: MainProject.documentsMultiUploadEndPoint,
              formData: FormData(),
            ),
          );
        });

        test('Then it should have a status code equal to 200', () async {
          /// Assert
          expect(201, response.response.statusCode);
        });

        test('Then it should return one of project', () async {
          /// Assert
          expect([''], response.data);
        });
      });
    });
  });

  group('Scenario of failure HTTP Request.', () {
    group('Given a random HTTP request.', () {
      group('When the application is loading', () {
        group('and there is no matched route.', () {
          /// Set up fail 404 request
          setUp(() async {
            /// Arrange
            when(
              mockService.getProjects(authorization: anyNamed('authorization')),
            ).thenThrow(
              (_) async => HttpResponse(
                error404,
                Response(
                  requestOptions: RequestOptions(),
                  statusCode: 404,
                ),
              ),
            );
          });
          test('Then it should thrown a NotFoundException', () async {
            try {
              /// Act
              await source.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'url-to-nowhere',
                ),
              );
            } catch (e) {
              /// Assert
              expect(NotFoundException, e.runtimeType);
              if (e is NotFoundException) {
                expect(404, e.httpError.statusCode);
                expect('NotFoundException', e.httpError.errorName);
                expect(ErrorMessage.notFoundMessage, e.httpError.description);
                expect(e.httpError.toJson(), isA<Map<String, dynamic>>());
              }
            }
          });
        });

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
      });
    });
  });
}

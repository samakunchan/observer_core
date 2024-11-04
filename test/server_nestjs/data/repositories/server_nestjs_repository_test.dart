import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/models/http_error/http_error.dart';
import 'package:observer_core/server_nestjs/feature_server_nestjs_export.dart';
import 'package:retrofit/retrofit.dart';

import '../fake_datas.dart';
import 'server_nestjs_repository_test.mocks.dart';

@GenerateMocks([AbstractServerNestjsSource])
void main() {
  late GetParams getParams;
  late UpsertParams upsertParams;
  late DeleteParams deleteParams;
  late SearchParams searchParams;
  late MockAbstractServerNestjsSource mockSource;
  late Either<Failure, HttpResponse<dynamic>> responses;
  late ServerNestjsRepository repository;

  group('In a successful scenario.', () {
    group('Given a GET request.', () {
      group('When the method getResponses() is called.', () {
        setUp(() async {
          mockSource = MockAbstractServerNestjsSource();
          repository = ServerNestjsRepository(remoteSource: mockSource);

          getParams = const GetParams(
            accessToken: 'accessToken',
            endPoint: 'endPoint',
          );

          /// Arrange
          when(
            mockSource.get(
              getParams,
            ),
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
          responses = await repository.getResponses(
            const GetParams(
              accessToken: 'accessToken',
              endPoint: 'endPoint',
            ),
          );
        });

        test('Then it should perform a GET request.', () async {
          /// Assert
          verify(
            mockSource.get(
              getParams,
            ),
          );
          verifyNoMoreInteractions(mockSource);
        });

        test('Then it should get a response in right side.', () async {
          /// Assert
          expect(true, responses is Right);
        });
      });
    });

    group('Given a POST request.', () {
      group('When the method upsertOne() is called.', () {
        setUp(() async {
          mockSource = MockAbstractServerNestjsSource();
          repository = ServerNestjsRepository(remoteSource: mockSource);

          upsertParams = const UpsertParams(
            accessToken: 'accessToken',
            endPoint: 'endPoint',
            body: '',
          );

          /// Arrange
          when(
            mockSource.upsert(
              upsertParams,
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDatasProjects,
              Response(
                requestOptions: RequestOptions(),
                statusCode: 201,
              ),
            ),
          );

          /// Act
          responses = await repository.upsertOne(
            upsertParams,
          );
        });

        test('Then it should perform a POST request.', () async {
          /// Assert
          verify(
            mockSource.upsert(
              upsertParams,
            ),
          );
          verifyNoMoreInteractions(mockSource);
        });

        test('Then it should get a response in right side.', () async {
          /// Assert
          expect(true, responses is Right);
        });
      });
    });

    group('Given a DELETE request', () {
      group('When the method deleteOne() is called.', () {
        setUp(() async {
          mockSource = MockAbstractServerNestjsSource();
          repository = ServerNestjsRepository(remoteSource: mockSource);
          deleteParams = const DeleteParams(
            accessToken: 'accessToken',
            endPoint: 'endPoint',
            body: '',
          );

          /// Arrange
          when(
            mockSource.delete(
              deleteParams,
            ),
          ).thenAnswer(
            (_) async => HttpResponse(
              fakeDeleteResponse,
              Response(
                requestOptions: RequestOptions(),
                statusCode: 200,
              ),
            ),
          );

          /// Act
          responses = await repository.deleteOne(
            deleteParams,
          );
        });

        test('Then it should perform a DELETE request', () async {
          /// Assert
          verify(
            mockSource.delete(
              deleteParams,
            ),
          );
          verifyNoMoreInteractions(mockSource);
        });

        test('Then it should get a response in right side', () async {
          /// Assert
          expect(true, responses is Right);
        });
      });
    });

    group('Given a SEARCH request', () {
      group('When the method search() is called.', () {
        setUp(() async {
          mockSource = MockAbstractServerNestjsSource();
          repository = ServerNestjsRepository(remoteSource: mockSource);

          searchParams = const SearchParams(
            accessToken: 'accessToken',
            endPoint: 'endPoint',
            input: 'fake-search',
          );

          /// Arrange
          when(
            mockSource.search(searchParams),
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
          responses = await repository.search(
            searchParams,
          );
        });

        test('Then it should perform a SEARCH request', () async {
          /// Assert
          verify(
            repository.search(
              searchParams,
            ),
          );
          verifyNoMoreInteractions(mockSource);
        });

        test('Then it should get a response in right side', () async {
          /// Assert
          expect(true, responses is Right);
        });

        test('Then event props should correct value', () async {
          /// Assert
          expect(searchParams.props, ['accessToken', 'fake-search', 'endPoint']);
        });
      });
    });
  });

  group('In a failure scenario.', () {
    group('Given a GET request.', () {
      group('When the method getResponses() is called.', () {
        group('Then it should get', () {
          setUp(() async {
            mockSource = MockAbstractServerNestjsSource();
            repository = ServerNestjsRepository(remoteSource: mockSource);
          });

          test('a response in left side.', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              BadRequestFailure(),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            );

            /// Assert
            expect(true, responses is Left);
          });

          test('a ServerFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              ServerException(),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(ServerFailure, failure.runtimeType);
                  if (failure is ServerFailure) {
                    expect(ErrorMessage.serverFailureMessage, failure.message);
                  }
                },
                (HttpResponse<dynamic> response) => null,
              );
          });

          test('a NotFoundFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              const NotFoundException(
                httpError: HttpError(
                  description: ErrorMessage.notFoundMessage,
                ),
              ),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(NotFoundFailure, failure.runtimeType);
                  if (failure is NotFoundFailure) {
                    expect(ErrorMessage.notFoundMessage, failure.message);
                  }
                },
                (HttpResponse<dynamic> response) => null,
              );
          });

          test('a UnAuthorizedFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              const UnAuthorizedException(
                httpError: HttpError(
                  description: ErrorMessage.unAuthorizationMessage,
                ),
              ),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(UnAuthorizedFailure, failure.runtimeType);
                  if (failure is UnAuthorizedFailure) {
                    expect(ErrorMessage.unAuthorizationMessage, failure.message);
                  }
                },
                (HttpResponse<dynamic> response) => null,
              );
          });

          test('a ForbiddenFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              const ForbiddenException(
                httpError: HttpError(
                  description: ErrorMessage.forbiddenMessage,
                ),
              ),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(ForbiddenFailure, failure.runtimeType);
                  if (failure is ForbiddenFailure) {
                    expect(ErrorMessage.forbiddenMessage, failure.message);
                  }
                },
                (HttpResponse<dynamic> response) => null,
              );
          });

          test('a BadRequestFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              const BadRequestException(),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(BadRequestFailure, failure.runtimeType);
                  if (failure is BadRequestFailure) {
                    expect('La description n‘a pas été définis dans les exceptions', failure.message);
                  }
                },
                (HttpResponse<dynamic> response) => null,
              );
          });

          test('a IDontKnowWhatImDoingFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow(
              IDontKnowWhatImDoingException(),
            );

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(IDontKnowWhatImDoingFailure, failure.runtimeType);
                },
                (HttpResponse<dynamic> response) => null,
              );
          });

          test('a NothingWorkDoingFailure', () async {
            /// Arrange
            when(
              mockSource.get(
                const GetParams(
                  accessToken: 'accessToken',
                  endPoint: 'endPoint',
                ),
              ),
            ).thenThrow('anything else');

            /// Act
            responses = await repository.getResponses(
              const GetParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
              ),
            )

              /// Assert
              ..fold(
                (Failure failure) {
                  expect(NothingWorkDoingFailure, failure.runtimeType);
                },
                (HttpResponse<dynamic> response) => null,
              );
          });
        });
      });
    });

    group('Given a POST request.', () {
      group('When the method upsertOne() is called.', () {
        setUp(() async {
          mockSource = MockAbstractServerNestjsSource();
          repository = ServerNestjsRepository(remoteSource: mockSource);

          /// Arrange
          when(
            mockSource.upsert(
              const UpsertParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
                body: '',
              ),
            ),
          ).thenThrow(
            const BadRequestFailure(),
          );

          /// Act
          responses = await repository.upsertOne(
            const UpsertParams(
              accessToken: 'accessToken',
              endPoint: 'endPoint',
              body: '',
            ),
          );
        });

        test('Then it should perform a POST request.', () async {
          /// Assert
          verify(
            mockSource.upsert(
              const UpsertParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
                body: '',
              ),
            ),
          );
          verifyNoMoreInteractions(mockSource);
        });

        test('Then it should get a response in right side.', () async {
          /// Assert
          expect(true, responses is Left);
        });
      });
    });

    group('Given a DELETE request', () {
      group('When the method deleteOne() is called.', () {
        setUp(() async {
          mockSource = MockAbstractServerNestjsSource();
          repository = ServerNestjsRepository(remoteSource: mockSource);

          /// Arrange
          when(
            mockSource.delete(
              const DeleteParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
                body: '',
              ),
            ),
          ).thenThrow(
            BadRequestFailure(),
          );

          /// Act
          responses = await repository.deleteOne(
            const DeleteParams(
              accessToken: 'accessToken',
              endPoint: 'endPoint',
              body: '',
            ),
          );
        });

        test('Then it should perform a DELETE request', () async {
          /// Assert
          verify(
            repository.deleteOne(
              const DeleteParams(
                accessToken: 'accessToken',
                endPoint: 'endPoint',
                body: '',
              ),
            ),
          );
          verifyNoMoreInteractions(mockSource);
        });

        test('Then it should get a response in right side', () async {
          /// Assert
          expect(true, responses is Left);
        });
      });
    });
  });
}

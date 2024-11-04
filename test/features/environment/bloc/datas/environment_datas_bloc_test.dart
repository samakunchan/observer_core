import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../server_nestjs/data/fake_datas.dart';
import 'environment_datas_bloc_test.mocks.dart';

class MockEnvironmentDatasBloc extends MockBloc<EnvironmentDatasEvent, EnvironmentDatasState> implements EnvironmentDatasBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractInMemoryApiNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late DeleteParams deleteParams;
  late UpsertParams upsertParams;
  late SearchParams searchParams;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late MockAbstractInMemoryApiNestjsRepository mockAbstractInMemoryApiNestjsRepository;
  late EnvironmentUpsertDTO environmentUpsertDTO;
  late EnvironmentDeleteDTO environmentDeleteDTO;
  EnvironmentAssociatedModel environmentAssociatedModel = EnvironmentAssociatedModel.fromJson(
    <String, dynamic>{
      'id': 1,
      'title': 'fake-title',
    },
  );

  late AuthTokenModel authTokenModel;
  late MockEnvironmentDatasBloc mockEnvironmentDatasBloc;

  final Map<String, dynamic> fakeJson = <String, dynamic>{
    'id': 999,
    'title': 'fake-title',
    'categories': <List<dynamic>>[],
  };
  final EnvironmentModel fakeEnvModel = EnvironmentModel.fromJson(fakeJson);

  final SearchResultModel fakeSearchResultModel = SearchResultModel.fromJson(
    <String, dynamic>{
      'id': 999,
      'title': 'fake-title',
    },
  );
  final Map<String, dynamic> fakeJsonSearch = <String, dynamic>{
    'total': 1,
    'results': <Map<String, dynamic>>[
      fakeSearchResultModel.toJson(),
    ],
  };

  final List<EnvironmentModel> fakeEnvs = List.of([fakeEnvModel]);

  /// Instanciation
  authTokenModel = fakeAuthToken;
  mockAbstractAuthTokenSource = MockAbstractAuthTokenSource();
  mockAbstractServerNestjsRepository = MockAbstractServerNestjsRepository();
  mockAbstractInMemoryApiNestjsRepository = MockAbstractInMemoryApiNestjsRepository();

  /// Création du stub pour les singletons
  GetIt.instance.registerSingleton<AbstractAuthTokenSource>(mockAbstractAuthTokenSource);
  GetIt.instance.registerSingleton<AbstractServerNestjsRepository>(mockAbstractServerNestjsRepository);
  GetIt.instance.registerSingleton<AbstractInMemoryApiNestjsRepository>(mockAbstractInMemoryApiNestjsRepository);

  /// Arrange token
  when(
    mockAbstractAuthTokenSource.getAuthToken(),
  ).thenAnswer(
    (_) => Future<AuthTokenModel>.value(authTokenModel),
  );

  /// Arrange storage
  when(
    mockAbstractInMemoryApiNestjsRepository.upsertResponses(
      UpsertParams(
        endPoint: MainProject.environmentsEndPoint,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(fakeEnvs),
      ),
    ),
  ).thenAnswer(
    (_) async => Right(
      HttpResponse(
        [
          <String, dynamic>{
            ...fakeJson,
            'environment': 1,
          }
        ],
        Response(
          requestOptions: RequestOptions(),
          statusCode: 201,
        ),
      ),
    ),
  );

  group('Scenario of EnvironmentDatasBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();
        });
        test('Then it should return [EnvironmentDatasIsSuccessfullyLoaded] state.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: EnvironmentDatasIsSuccessfullyLoaded(selectedId: 1, environments: fakeEnvs),
          );

          /// Act
          // no act

          /// Assert
          expect(
            mockEnvironmentDatasBloc.state,
            equals(
              EnvironmentDatasIsSuccessfullyLoaded(selectedId: 1, environments: fakeEnvs),
            ),
          );
        });
      });
    });
    group('Given the fact environments are requested.', () {});

    /// SUCCESSFULLY LOADED
    group('Given the fact the environments are loaded successfully.', () {
      /// LOCAL
      group('When event [EnvironmentDatasInMemoryRequested] event is detected.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();
          getParams = GetParams(
            endPoint: MainProject.environmentsEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange Local
          when(
            mockAbstractInMemoryApiNestjsRepository.getResponses(getParams),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeEnvModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeEnvModel.toJson()],
                  ),
                ),
              ),
            ),
          );

          /// Arrange API
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeEnvModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeEnvModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of environments.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: const EnvironmentDatasIsSuccessfullyLoadedInMemory(selectedId: 1),
          );

          /// Act
          final EnvironmentDatasEvent event = EnvironmentDatasInMemoryRequested(
            environments: fakeEnvs,
          );
          mockEnvironmentDatasBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeEnvs]));
        });

        blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
          'Then it should give [EnvironmentDatasIsLoading] and [EnvironmentDatasIsSusscessfullyLoaded] states.',
          build: EnvironmentDatasBloc.new,

          /// Act
          act: (EnvironmentDatasBloc bloc) => bloc.add(
            EnvironmentDatasInMemoryRequested(
              environments: fakeEnvs,
            ),
          ),

          /// Assert
          expect: () => <EnvironmentDatasState>[
            EnvironmentDatasIsSuccessfullyLoadedInMemory(environments: fakeEnvs, selectedId: 1),
          ],
        );
      });

      /// API
      group('When event [EnvironmentDatasRequested] is detected.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();
          getParams = GetParams(
            endPoint: MainProject.environmentsEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange
          /// Arrange Local
          when(
            mockAbstractInMemoryApiNestjsRepository.getResponses(getParams),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeEnvModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeEnvModel.toJson()],
                  ),
                ),
              ),
            ),
          );

          /// Arrange API
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeEnvModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeEnvModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of environments.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: EnvironmentDatasIsSuccessfullyLoaded(selectedId: 1, environments: fakeEnvs),
          );

          /// Act
          final EnvironmentDatasEvent event = EnvironmentDatasRequested(environments: fakeEnvs);
          mockEnvironmentDatasBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeEnvs]));
        });

        blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
          'Then it should give a [EnvironmentDatasRequested] state.',
          build: EnvironmentDatasBloc.new,

          /// Act
          act: (EnvironmentDatasBloc bloc) => bloc.add(EnvironmentDatasRequested(environments: fakeEnvs)),

          /// Assert
          expect: () => <EnvironmentDatasState>[
            EnvironmentDatasIsSuccessfullyLoaded(
              selectedId: 1,
              environments: fakeEnvs,
              filteredEnvironments: fakeEnvs.where((EnvironmentModel environment) => environment.id == 1).toList(),
            ),
          ],
        );
      });

      /// REQUEST ERRORS
      group('When event [EnvironmentDatasErrorsRequested] is detected.', () {
        test('Then the props should contain a failure message.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: EnvironmentDatasIsSuccessfullyLoaded(selectedId: 1, environments: fakeEnvs),
          );

          /// Act
          const EnvironmentDatasEvent event = EnvironmentDatasErrorsRequested(message: 'error message');
          mockEnvironmentDatasBloc.add(event);

          /// Assert
          expect(event.props, equals(['error message']));
        });

        blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
          'Then it should give a [EnvironmentDatasHasFailure] state.',
          build: EnvironmentDatasBloc.new,

          /// Act
          act: (EnvironmentDatasBloc bloc) => bloc.add(const EnvironmentDatasErrorsRequested(message: 'error message')),

          /// Assert
          expect: () => <EnvironmentDatasState>[
            const EnvironmentDatasHasFailure(message: 'error message'),
          ],
        );
      });

      /// SELECTED
      group('When event [EnvironmentDatasSelected] is detected.', () {
        test('Then the props should contain a list of environments.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: EnvironmentDatasIsSuccessfullyLoaded(selectedId: 1, environments: fakeEnvs),
          );

          /// Act
          final EnvironmentDatasEvent event = EnvironmentDatasSelected(environments: fakeEnvs, filterId: 1);
          mockEnvironmentDatasBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeEnvs, 1]));
        });

        blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
          'Then it should give a [EnvironmentDatasIsSusscessfullyLoaded] state.',
          build: EnvironmentDatasBloc.new,

          /// Act
          act: (EnvironmentDatasBloc bloc) => bloc.add(EnvironmentDatasSelected(environments: fakeEnvs, filterId: 1)),

          /// Assert
          expect: () => <EnvironmentDatasState>[
            EnvironmentDatasIsSuccessfullyLoaded(selectedId: 1, environments: fakeEnvs),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact a form is submitted', () {
      group('When event [EnvironmentDatasSubmitted] is detected.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();

          environmentUpsertDTO = EnvironmentUpsertDTO.fromJson(
            <String, dynamic>{
              'title': 'fake-title',
              'categories': <Map<String, dynamic>>[
                <String, dynamic>{
                  'title': 'Titre de la catégorie',
                  'content': 'Description de la catégorie',
                  'environment': 3,
                },
              ],
            },
          );

          upsertParams = UpsertParams(
            endPoint: MainProject.environmentsEndPoint,
            accessToken: authTokenModel.accessToken,
            body: jsonEncode(environmentUpsertDTO),
          );

          /// Arrange API
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              upsertParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  fakeEnvModel.toJson(),
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: fakeEnvModel.toJson(),
                  ),
                ),
              ),
            ),
          );
        });
        test('Then the props should contain a list of environments.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: const EnvironmentDatasFormIsSubmittedSuccessfully(id: 999),
          );

          /// Act
          final EnvironmentDatasEvent event = EnvironmentDatasSubmitted(environmentForUpsert: environmentUpsertDTO);
          mockEnvironmentDatasBloc.add(event);

          /// Assert
          expect(event.props, equals([environmentUpsertDTO]));
        });

        blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
          'Then it should give a [EnvironmentDatasFormIsSubmittedSuccessfully] state.',
          build: EnvironmentDatasBloc.new,

          /// Act
          act: (EnvironmentDatasBloc bloc) => bloc.add(EnvironmentDatasSubmitted(environmentForUpsert: environmentUpsertDTO)),

          /// Assert
          expect: () => <EnvironmentDatasState>[
            EnvironmentDatasIsSubmitting(),
            const EnvironmentDatasFormIsSubmittedSuccessfully(id: 999),
          ],
        );
      });
    });

    /// FIND DUPLICATED
    group('Given the fact that one environment is creating', () {
      group('When writing a new title in the form.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();
          environmentAssociatedModel = EnvironmentAssociatedModel.fromJson(<String, dynamic>{
            'title': 'fake-title',
          });
          searchParams = SearchParams(
            accessToken: fakeAuthToken.accessToken,
            endPoint: MainProject.environmentsSearchEndPoint,
            strictMode: true,
            input: environmentAssociatedModel.title,
          );

          /// ICI

          /// Arrange API
          when(
            mockAbstractServerNestjsRepository.search(
              searchParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  fakeJsonSearch,
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: fakeJsonSearch,
                  ),
                ),
              ),
            ),
          );
        });

        test('Then it should find a result.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.search(searchParams);

          responses.fold((Failure failure) => null, (HttpResponse<dynamic> response) {
            final SearchModel searchResponse = SearchModel.fromJson(response.data as Map<String, dynamic>);

            /// Assert
            expect(searchResponse.results.isNotEmpty, true);
            expect(environmentAssociatedModel.toJson(), isA<Map<String, dynamic>>());
            expect(searchResponse.toJson(), isA<Map<String, dynamic>>());
          });
        });
      });
    });

    /// DELETE
    group('Given the fact that one environment is deleted', () {
      group('When event [EnvironmentDatasDeleted] is detected.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();
          environmentDeleteDTO = EnvironmentDeleteDTO.fromJson(<String, dynamic>{
            'id': 999,
            'title': 'fake-title',
            'categories': <Map<String, dynamic>>[
              <String, dynamic>{
                'title': 'Titre de la catégorie',
                'content': 'Description de la catégorie',
                // 'environment': 3,
              },
            ],
          });
          deleteParams = DeleteParams(
            endPoint: MainProject.environmentsEndPoint,
            accessToken: authTokenModel.accessToken,
            body: jsonEncode(environmentDeleteDTO),
          );

          /// Arrange API
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              deleteParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  fakeEnvModel.toJson(),
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: fakeEnvModel.toJson(),
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a environmentDeleteDTO.', () {
          /// Arrange
          whenListen(
            mockEnvironmentDatasBloc,
            Stream.fromIterable([]),
            initialState: const EnvironmentDatasFormIsSubmittedSuccessfully(id: 1),
          );

          /// Act
          final EnvironmentDatasEvent event = EnvironmentDatasDeleted(environmentForDelete: environmentDeleteDTO);
          mockEnvironmentDatasBloc.add(event);

          /// Assert
          expect(event.props, equals([environmentDeleteDTO]));
        });

        blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
          'Then it should give a [EnvironmentDatasIsDeletedSuccessfully] state.',
          build: EnvironmentDatasBloc.new,

          /// Act
          act: (EnvironmentDatasBloc bloc) => bloc.add(EnvironmentDatasDeleted(environmentForDelete: environmentDeleteDTO)),

          /// Assert
          expect: () => <EnvironmentDatasState>[
            EnvironmentDatasIsSubmitting(),
            EnvironmentDatasIsDeletedSuccessfully(),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockEnvironmentDatasBloc = MockEnvironmentDatasBloc();
        });
        testAPIFailures(mockAbstractServerNestjsRepository);
        // testInMemoryFailures(mockAbstractInMemoryApiNestjsRepository, fakeEnvs);
      });
    });
  });
}

void testAPIFailures(
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
) {
  final List<Failure> failures = List<Failure>.of([
    const ServerFailure(),
    const CacheFailure(),
    const NotFoundFailure(),
    const BadRequestFailure(),
    const NetworkFailure(),
    const UnAuthorizedFailure(),
    const ForbiddenFailure(),
    IDontKnowWhatImDoingFailure(),
    UnExpectedFailure(),
  ]);

  final List<EnvironmentDatasEvent> eventsWithUpsertParams = List<EnvironmentDatasEvent>.of([
    EnvironmentDatasSubmitted(
      environmentForUpsert: EnvironmentUpsertDTO.fromJson(<String, dynamic>{
        'title': 'fake-title',
      }),
    ),
  ]);

  final List<EnvironmentDatasEvent> eventsWithDeleteParams = List<EnvironmentDatasEvent>.of([
    EnvironmentDatasDeleted(
      environmentForDelete: EnvironmentDeleteDTO.fromJson(<String, dynamic>{
        'title': 'fake-title',
        'id': 999,
      }),
    ),
  ]);

  for (final EnvironmentDatasEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
        'Then it should give [EnvironmentDatasHasFailure] state for $failure.',
        build: EnvironmentDatasBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.environmentsEndPoint,
                body: jsonEncode(
                  EnvironmentUpsertDTO.fromJson(<String, dynamic>{
                    'title': 'fake-title',
                  }).toJson(),
                ),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (EnvironmentDatasBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <EnvironmentDatasState>[EnvironmentDatasIsSubmitting()]
            : <EnvironmentDatasState>[
                EnvironmentDatasIsSubmitting(),
                EnvironmentDatasHasFailure(message: failure.message),
              ],
      );
    }
  }

  for (final EnvironmentDatasEvent event in eventsWithDeleteParams) {
    for (final Failure failure in failures) {
      blocTest<EnvironmentDatasBloc, EnvironmentDatasState>(
        'Then it should give [EnvironmentDatasHasFailure] state for $failure.',
        build: EnvironmentDatasBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              DeleteParams(
                endPoint: MainProject.environmentsEndPoint,
                accessToken: fakeAuthToken.accessToken,
                body: jsonEncode(
                  EnvironmentDeleteDTO.fromJson(<String, dynamic>{
                    'title': 'fake-title',
                    'id': 999,
                  }),
                ),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (EnvironmentDatasBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <EnvironmentDatasState>[EnvironmentDatasIsSubmitting()]
            : <EnvironmentDatasState>[
                EnvironmentDatasIsSubmitting(),
                EnvironmentDatasHasFailure(message: failure.message),
              ],
      );
    }
  }
}

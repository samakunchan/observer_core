import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../server_nestjs/data/fake_datas.dart';
import 'environment_store_bloc_test.mocks.dart';

class MockEnvironmentStoreBloc extends MockBloc<EnvironmentStoreEvent, EnvironmentStoreState> implements EnvironmentStoreBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractInMemoryApiNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late MockAbstractInMemoryApiNestjsRepository mockAbstractInMemoryApiNestjsRepository;

  late AuthTokenModel authTokenModel;
  late MockEnvironmentStoreBloc mockEnvironmentStoreBloc;

  final Map<String, dynamic> fakeJson = <String, dynamic>{
    'id': 999,
    'title': 'fake-title',
    'categories': <List<dynamic>>[],
  };
  final EnvironmentModel fakeEnvModel = EnvironmentModel.fromJson(fakeJson);

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

  group('Scenario of EnvironmentStoreBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockEnvironmentStoreBloc = MockEnvironmentStoreBloc();
        });
        test('Then it should return [EnvironmentStoreInitial] state.', () {
          /// Arrange
          whenListen(
            mockEnvironmentStoreBloc,
            Stream.fromIterable([]),
            initialState: EnvironmentStoreInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockEnvironmentStoreBloc.state, equals(EnvironmentStoreInitial()));
        });
      });
    });
    group('Given the fact environments are reloaded.', () {
      group('When event [EnvironmentsStoreReloaded] is detected.', () {
        setUp(() {
          mockEnvironmentStoreBloc = MockEnvironmentStoreBloc();
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

        test('Then it should have no props.', () {
          /// Arrange
          whenListen(
            mockEnvironmentStoreBloc,
            Stream.fromIterable([]),
            initialState: EnvironmentStoreInitial(),
          );

          /// Act
          final EnvironmentStoreEvent event = EnvironmentsStoreReloaded();
          mockEnvironmentStoreBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<EnvironmentStoreBloc, EnvironmentStoreState>(
          'Then it should give a [EnvironmentStoreInitial] state.',
          build: EnvironmentStoreBloc.new,

          /// Act
          act: (EnvironmentStoreBloc bloc) => bloc.add(EnvironmentsStoreReloaded()),

          /// Assert
          expect: () => <EnvironmentStoreState>[
            EnvironmentStoreIsLoading(),
            EnvironmentsStoreIsOpenInMemory(environments: fakeEnvs, selectedId: 1),
          ],
        );
      });
    });

    /// SUCCESSFULLY LOADED
    group('Given the fact the environments are loaded successfully.', () {
      /// LOCAL
      group('When event [EnvironmentsStoreRequested] event is detected.', () {
        setUp(() {
          mockEnvironmentStoreBloc = MockEnvironmentStoreBloc();
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
            mockEnvironmentStoreBloc,
            Stream.fromIterable([
              EnvironmentStoreInitial(),
              EnvironmentStoreIsLoading(),
              EnvironmentsStoreIsOpen(
                environments: fakeEnvs,
                selectedId: 1,
              ),
            ]),
            initialState: EnvironmentStoreInitial(),
          );

          /// Act
          final EnvironmentStoreEvent event = EnvironmentsStoreInMemoryRequested(
            environments: fakeEnvs,
          );
          mockEnvironmentStoreBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeEnvs]));
        });

        blocTest<EnvironmentStoreBloc, EnvironmentStoreState>(
          'Then it should give [EnvironmentStoreIsLoading] and [EnvironmentsStoreIsOpenInMemory] states.',
          build: EnvironmentStoreBloc.new,

          /// Act
          act: (EnvironmentStoreBloc bloc) => bloc.add(
            EnvironmentsStoreInMemoryRequested(
              environments: fakeEnvs,
            ),
          ),

          /// Assert
          expect: () => <EnvironmentStoreState>[
            EnvironmentStoreIsLoading(),
            EnvironmentsStoreIsOpenInMemory(environments: fakeEnvs, selectedId: 1),
          ],
        );
      });

      /// API
      group('When event [EnvironmentsRequested] event is detected.', () {
        setUp(() {
          mockEnvironmentStoreBloc = MockEnvironmentStoreBloc();
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
            mockEnvironmentStoreBloc,
            Stream.fromIterable([
              EnvironmentStoreInitial(),
              EnvironmentStoreIsLoading(),
              EnvironmentsStoreIsOpen(
                environments: fakeEnvs,
                selectedId: 1,
              ),
            ]),
            initialState: EnvironmentStoreInitial(),
          );

          /// Act
          final EnvironmentStoreEvent event = EnvironmentsStoreRequested(
            environments: fakeEnvs,
          );
          mockEnvironmentStoreBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeEnvs]));
        });

        blocTest<EnvironmentStoreBloc, EnvironmentStoreState>(
          'Then it should give [EnvironmentStoreIsLoading] and [EnvironmentsStoreIsOpenInMemory] states.',
          build: EnvironmentStoreBloc.new,

          /// Act
          act: (EnvironmentStoreBloc bloc) => bloc.add(
            EnvironmentsStoreRequested(
              environments: fakeEnvs,
            ),
          ),

          /// Assert
          expect: () => <EnvironmentStoreState>[
            EnvironmentStoreIsLoading(),
            EnvironmentsStoreIsOpen(environments: fakeEnvs, selectedId: 1),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockEnvironmentStoreBloc = MockEnvironmentStoreBloc();
        });

        testAPIFailures(mockAbstractServerNestjsRepository, fakeEnvs);
        testInMemoryFailures(mockAbstractInMemoryApiNestjsRepository, fakeEnvs);
      });
    });
  });
}

void testAPIFailures(
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
  List<EnvironmentModel> fakeEnvs,
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

  final List<EnvironmentStoreEvent> eventsWithGetParams = List<EnvironmentStoreEvent>.of([
    EnvironmentsStoreRequested(environments: fakeEnvs),
    EnvironmentsStoreReloaded(),
    // EnvironmentsStoreInMemoryRequested(environments: fakeEnvs),
  ]);

  for (final EnvironmentStoreEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<EnvironmentStoreBloc, EnvironmentStoreState>(
        'Then it should give [EnvironmentsStoreIsClosed] state for $failure.',
        build: EnvironmentStoreBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                endPoint: MainProject.environmentsEndPoint,
                accessToken: fakeAuthToken.accessToken,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (EnvironmentStoreBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <EnvironmentStoreState>[EnvironmentStoreIsLoading()]
            : <EnvironmentStoreState>[
                EnvironmentStoreIsLoading(),
                EnvironmentsStoreIsClosed(message: failure.message),
              ],
      );
    }
  }
}

void testInMemoryFailures(
  MockAbstractInMemoryApiNestjsRepository mock,
  List<EnvironmentModel> fakeEnvs,
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

  final List<EnvironmentStoreEvent> eventsWithGetParams = List<EnvironmentStoreEvent>.of([
    EnvironmentsStoreInMemoryRequested(environments: fakeEnvs),
  ]);

  for (final EnvironmentStoreEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<EnvironmentStoreBloc, EnvironmentStoreState>(
        'Then it should give [EnvironmentsStoreIsClosed] state for $failure.',
        build: EnvironmentStoreBloc.new,

        /// Arrange
        setUp: () {
          when(
            mock.getResponses(
              GetParams(
                endPoint: MainProject.environmentsEndPoint,
                accessToken: fakeAuthToken.accessToken,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (EnvironmentStoreBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <EnvironmentStoreState>[EnvironmentStoreIsLoading()]
            : <EnvironmentStoreState>[
                EnvironmentStoreIsLoading(),
                EnvironmentsStoreIsClosed(message: failure.message),
              ],
      );
    }
  }
}

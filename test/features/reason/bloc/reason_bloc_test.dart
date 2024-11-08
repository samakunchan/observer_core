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

import '../../../server_nestjs/data/fake_datas.dart';
import 'reason_bloc_test.mocks.dart';

class MockReasonBloc extends MockBloc<ReasonEvent, ReasonState> implements ReasonBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late UpsertParams upsertParams;
  late DeleteParams deleteParams;
  late ReasonsDTO reasonsDTO;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late AuthTokenModel authTokenModel;
  late MockReasonBloc mockReasonBloc;
  final Map<String, dynamic> fakeJsonDTO = <String, dynamic>{
    'reason': 'fake-reason',
  };
  final Map<String, dynamic> fakeJsonModel = <String, dynamic>{
    'reason': 'fake-reason',
  };
  final ReasonModel reasonModel = ReasonModel.fromJson(fakeJsonModel);
  late List<ReasonModel> fakeReasons;

  /// Instanciation
  authTokenModel = fakeAuthToken;
  mockAbstractAuthTokenSource = MockAbstractAuthTokenSource();
  mockAbstractServerNestjsRepository = MockAbstractServerNestjsRepository();

  /// Création du stub pour les singletons
  GetIt.instance.registerSingleton<AbstractAuthTokenSource>(mockAbstractAuthTokenSource);
  GetIt.instance.registerSingleton<AbstractServerNestjsRepository>(mockAbstractServerNestjsRepository);

  /// Arrange token
  when(
    mockAbstractAuthTokenSource.getAuthToken(),
  ).thenAnswer(
    (_) => Future<AuthTokenModel>.value(authTokenModel),
  );

  group('Scenario of ReasonBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockReasonBloc = MockReasonBloc();
        });
        test('Then it should return [ReasonInitial] state.', () {
          /// Arrange
          whenListen(
            mockReasonBloc,
            Stream.fromIterable([]),
            initialState: ReasonInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockReasonBloc.state, equals(ReasonInitial()));
        });
      });
    });

    /// LOADED
    group('Given the fact reasons are loaded successfully.', () {
      group('When event [ReasonRequested] is detected.', () {
        setUp(() {
          mockReasonBloc = MockReasonBloc();
          fakeReasons = [reasonModel];

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.reasons,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeJsonModel],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeJsonModel],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then results should be a json.', () {
          /// Assert
          expect(reasonModel.toJson(), isA<Map<String, dynamic>>());
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockReasonBloc,
            Stream.fromIterable([]),
            initialState: ReasonsAreLoadedSuccessfully(reasons: fakeReasons),
          );

          /// Act
          const ReasonEvent event = ReasonsRequested();
          mockReasonBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<ReasonBloc, ReasonState>(
          'Then it should return [ReasonAreLoadedSuccessfully] state.',
          build: ReasonBloc.new,

          /// Act
          act: (ReasonBloc bloc) => bloc.add(const ReasonsRequested()),

          /// Assert
          expect: () => <ReasonState>[
            ReasonsAreLoadedSuccessfully(reasons: fakeReasons),
          ],
        );
      });
      group('When event [ReasonsUpdated] is detected.', () {
        setUp(() {
          mockReasonBloc = MockReasonBloc();
          fakeReasons = [reasonModel];
        });

        test('Then results should be a json.', () {
          /// Assert
          expect(reasonModel.toJson(), isA<Map<String, dynamic>>());
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockReasonBloc,
            Stream.fromIterable([]),
            initialState: ReasonsAreLoadedSuccessfully(reasons: fakeReasons),
          );

          /// Act
          final ReasonEvent event = ReasonsUpdated(reasons: fakeReasons);
          mockReasonBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeReasons]));
        });

        blocTest<ReasonBloc, ReasonState>(
          'Then it should return [ReasonAreLoadedSuccessfully] state.',
          build: ReasonBloc.new,

          /// Act
          act: (ReasonBloc bloc) => bloc.add(ReasonsUpdated(reasons: fakeReasons)),

          /// Assert
          expect: () => <ReasonState>[
            ReasonsAreLoadedSuccessfully(reasons: fakeReasons),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact a reason is submitted successfully.', () {
      group('When event [ReasonSubmitted] is detected.', () {
        setUp(() {
          mockReasonBloc = MockReasonBloc();
          reasonsDTO = ReasonsDTO.fromJson(fakeJsonDTO);

          upsertParams = UpsertParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.reasons,
            body: jsonEncode(reasonsDTO.toJson()),
          );

          when(
            mockAbstractServerNestjsRepository.upsertOne(
              upsertParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  fakeJsonDTO,
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: fakeJsonDTO,
                  ),
                ),
              ),
            ),
          );
        });
        test('Then event should have a reason DTO.', () {
          /// Arrange
          whenListen(
            mockReasonBloc,
            Stream.fromIterable([]),
            initialState: ReasonIsSubmittingSuccessfully(reason: reasonModel),
          );

          /// Act
          final ReasonEvent event = ReasonSubmitted(reasonsDTO: reasonsDTO);
          mockReasonBloc.add(event);

          /// Assert
          expect(event.props, equals([reasonsDTO]));
        });

        blocTest<ReasonBloc, ReasonState>(
          'Then it should return [ReasonFormIsSubmittedSuccessfully] state.',
          build: ReasonBloc.new,

          /// Act
          act: (ReasonBloc bloc) => bloc.add(ReasonSubmitted(reasonsDTO: reasonsDTO)),

          /// Assert
          expect: () => <ReasonState>[
            ReasonIsSubmittingSuccessfully(reason: reasonModel),
          ],
        );
      });
    });

    /// DELETE
    group('Given the fact a reason is deleted successfully.', () {
      group('When event [ReasonIsRemovedSuccessfully] is detected.', () {
        setUp(() {
          mockReasonBloc = MockReasonBloc();

          deleteParams = DeleteParams(
            accessToken: authTokenModel.accessToken,
            body: '999',
            endPoint: MainProject.reasons,
          );

          when(
            mockAbstractServerNestjsRepository.deleteOne(
              deleteParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  <String, dynamic>{
                    'message': 'Fake reason deleted',
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      'message': 'Fake reason deleted',
                    },
                  ),
                ),
              ),
            ),
          );
        });
        test('Then event should have an id.', () {
          /// Arrange
          whenListen(
            mockReasonBloc,
            Stream.fromIterable([]),
            initialState: ReasonIsRemovedSuccessfully(),
          );

          /// Act
          const ReasonEvent event = ReasonDeleted(id: 999);
          mockReasonBloc.add(event);

          /// Assert
          expect(event.props, equals([999]));
        });

        blocTest<ReasonBloc, ReasonState>(
          'Then it should return [ReasonIsRemovedSuccessfully] state.',
          build: ReasonBloc.new,

          /// Act
          act: (ReasonBloc bloc) => bloc.add(const ReasonDeleted(id: 999)),

          /// Assert
          expect: () => <ReasonState>[
            ReasonIsRemovedSuccessfully(),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockReasonBloc = MockReasonBloc();
        });
        testAPIFailures(mockAbstractServerNestjsRepository);
        testFailureUpsert(mockAbstractServerNestjsRepository);
        testFailureDelete(mockAbstractServerNestjsRepository);
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

  final List<ReasonEvent> eventsWithGetParams = List<ReasonEvent>.of([
    const ReasonsRequested(),
  ]);

  for (final ReasonEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<ReasonBloc, ReasonState>(
        'Then it should give [ReasonHaveFailure] state for $failure.',
        build: ReasonBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.reasons,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ReasonBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ReasonState>[ReasonsAreLoading()]
            : <ReasonState>[
                ReasonsHaveFailure(message: failure.message),
              ],
      );
    }
  }
}

void testFailureUpsert(
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

  final Map<String, dynamic> fakeJsonDTO = <String, dynamic>{
    'reason': 'fake-reason',
  };

  final ReasonsDTO reasonsDTO = ReasonsDTO.fromJson(fakeJsonDTO);
  final List<ReasonEvent> eventsWithUpsertParams = List<ReasonEvent>.of([
    ReasonSubmitted(
      reasonsDTO: reasonsDTO,
    ),
  ]);

  for (final ReasonEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<ReasonBloc, ReasonState>(
        'Then it should give [ReasonHaveFailure] state for $failure.',
        build: ReasonBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.reasons,
                body: jsonEncode(reasonsDTO.toJson()),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ReasonBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ReasonState>[
                ReasonsAreLoading(),
              ]
            : <ReasonState>[
                ReasonsHaveFailure(message: failure.message),
              ],
      );
    }
  }
}

void testFailureDelete(
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

  final List<ReasonEvent> eventsWithDeleteParams = List<ReasonEvent>.of([
    const ReasonDeleted(id: 999),
  ]);

  for (final ReasonEvent event in eventsWithDeleteParams) {
    for (final Failure failure in failures) {
      blocTest<ReasonBloc, ReasonState>(
        'Then it should give [ReasonHaveFailure] state for $failure.',
        build: ReasonBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              DeleteParams(
                accessToken: fakeAuthToken.accessToken,
                body: '999',
                endPoint: MainProject.reasons,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ReasonBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ReasonState>[ReasonsAreLoading()]
            : <ReasonState>[
                ReasonsHaveFailure(message: failure.message),
              ],
      );
    }
  }
}

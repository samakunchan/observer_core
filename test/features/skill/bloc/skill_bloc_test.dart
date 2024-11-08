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
import 'skill_bloc_test.mocks.dart';

class MockSkillBloc extends MockBloc<SkillEvent, SkillState> implements SkillBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late UpsertParams upsertParams;
  late DeleteParams deleteParams;
  late SkillsDTO skillsDTO;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late AuthTokenModel authTokenModel;
  late MockSkillBloc mockSkillBloc;
  final Map<String, dynamic> fakeJsonDTO = <String, dynamic>{
    'techno': 'fake-techno',
    'level': 'fake-level',
    'position': 'fake-position',
  };
  final Map<String, dynamic> fakeJsonModel = <String, dynamic>{
    'techno': 'fake-techno',
    'level': 'fake-level',
    'position': 'fake-position',
  };
  final SkillModel skillModel = SkillModel.fromJson(fakeJsonModel);
  late List<SkillModel> fakeSkills;

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

  group('Scenario of SkillBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockSkillBloc = MockSkillBloc();
        });
        test('Then it should return [SkillInitial] state.', () {
          /// Arrange
          whenListen(
            mockSkillBloc,
            Stream.fromIterable([]),
            initialState: SkillInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockSkillBloc.state, equals(SkillInitial()));
        });
      });
    });

    /// LOADED
    group('Given the fact skills are loaded successfully.', () {
      group('When event [SkillRequested] is detected.', () {
        setUp(() {
          mockSkillBloc = MockSkillBloc();
          fakeSkills = [skillModel];

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.skills,
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
          expect(skillModel.toJson(), isA<Map<String, dynamic>>());
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockSkillBloc,
            Stream.fromIterable([]),
            initialState: SkillsAreLoadedSuccessfully(skills: fakeSkills),
          );

          /// Act
          const SkillEvent event = SkillsRequested();
          mockSkillBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<SkillBloc, SkillState>(
          'Then it should return [SkillAreLoadedSuccessfully] state.',
          build: SkillBloc.new,

          /// Act
          act: (SkillBloc bloc) => bloc.add(const SkillsRequested()),

          /// Assert
          expect: () => <SkillState>[
            SkillsAreLoadedSuccessfully(skills: fakeSkills),
          ],
        );
      });
      group('When event [SkillsUpdated] is detected.', () {
        setUp(() {
          mockSkillBloc = MockSkillBloc();
          fakeSkills = [skillModel];
        });

        test('Then results should be a json.', () {
          /// Assert
          expect(skillModel.toJson(), isA<Map<String, dynamic>>());
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockSkillBloc,
            Stream.fromIterable([]),
            initialState: SkillsAreLoadedSuccessfully(skills: fakeSkills),
          );

          /// Act
          final SkillEvent event = SkillsUpdated(skills: fakeSkills);
          mockSkillBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeSkills]));
        });

        blocTest<SkillBloc, SkillState>(
          'Then it should return [SkillAreLoadedSuccessfully] state.',
          build: SkillBloc.new,

          /// Act
          act: (SkillBloc bloc) => bloc.add(SkillsUpdated(skills: fakeSkills)),

          /// Assert
          expect: () => <SkillState>[
            SkillsAreLoadedSuccessfully(skills: fakeSkills),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact a skill is submitted successfully.', () {
      group('When event [SkillSubmitted] is detected.', () {
        setUp(() {
          mockSkillBloc = MockSkillBloc();
          skillsDTO = SkillsDTO.fromJson(fakeJsonDTO);

          upsertParams = UpsertParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.skills,
            body: jsonEncode(skillsDTO.toJson()),
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
        test('Then event should have a skill DTO.', () {
          /// Arrange
          whenListen(
            mockSkillBloc,
            Stream.fromIterable([]),
            initialState: SkillIsSubmittingSuccessfully(skill: skillModel),
          );

          /// Act
          final SkillEvent event = SkillSubmitted(skillsDTO: skillsDTO);
          mockSkillBloc.add(event);

          /// Assert
          expect(event.props, equals([skillsDTO]));
        });

        blocTest<SkillBloc, SkillState>(
          'Then it should return [SkillFormIsSubmittedSuccessfully] state.',
          build: SkillBloc.new,

          /// Act
          act: (SkillBloc bloc) => bloc.add(SkillSubmitted(skillsDTO: skillsDTO)),

          /// Assert
          expect: () => <SkillState>[
            SkillIsSubmittingSuccessfully(skill: skillModel),
          ],
        );
      });
    });

    /// DELETE
    group('Given the fact a skill is deleted successfully.', () {
      group('When event [SkillIsRemovedSuccessfully] is detected.', () {
        setUp(() {
          mockSkillBloc = MockSkillBloc();

          deleteParams = DeleteParams(
            accessToken: authTokenModel.accessToken,
            body: '999',
            endPoint: MainProject.skills,
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
                    'message': 'Fake skill deleted',
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      'message': 'Fake skill deleted',
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
            mockSkillBloc,
            Stream.fromIterable([]),
            initialState: SkillIsRemovedSuccessfully(),
          );

          /// Act
          const SkillEvent event = SkillDeleted(id: 999);
          mockSkillBloc.add(event);

          /// Assert
          expect(event.props, equals([999]));
        });

        blocTest<SkillBloc, SkillState>(
          'Then it should return [SkillIsRemovedSuccessfully] state.',
          build: SkillBloc.new,

          /// Act
          act: (SkillBloc bloc) => bloc.add(const SkillDeleted(id: 999)),

          /// Assert
          expect: () => <SkillState>[
            SkillIsRemovedSuccessfully(),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockSkillBloc = MockSkillBloc();
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

  final List<SkillEvent> eventsWithGetParams = List<SkillEvent>.of([
    const SkillsRequested(),
  ]);

  for (final SkillEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<SkillBloc, SkillState>(
        'Then it should give [SkillHaveFailure] state for $failure.',
        build: SkillBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.skills,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (SkillBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <SkillState>[SkillsAreLoading()]
            : <SkillState>[
                SkillsHaveFailure(message: failure.message),
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
    'techno': 'fake-techno',
    'level': 'fake-level',
    'position': 'fake-position',
  };

  final SkillsDTO skillsDTO = SkillsDTO.fromJson(fakeJsonDTO);
  final List<SkillEvent> eventsWithUpsertParams = List<SkillEvent>.of([
    SkillSubmitted(
      skillsDTO: skillsDTO,
    ),
  ]);

  for (final SkillEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<SkillBloc, SkillState>(
        'Then it should give [SkillHaveFailure] state for $failure.',
        build: SkillBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.skills,
                body: jsonEncode(skillsDTO.toJson()),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (SkillBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <SkillState>[
                SkillsAreLoading(),
              ]
            : <SkillState>[
                SkillsHaveFailure(message: failure.message),
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

  final List<SkillEvent> eventsWithDeleteParams = List<SkillEvent>.of([
    const SkillDeleted(id: 999),
  ]);

  for (final SkillEvent event in eventsWithDeleteParams) {
    for (final Failure failure in failures) {
      blocTest<SkillBloc, SkillState>(
        'Then it should give [SkillHaveFailure] state for $failure.',
        build: SkillBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              DeleteParams(
                accessToken: fakeAuthToken.accessToken,
                body: '999',
                endPoint: MainProject.skills,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (SkillBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <SkillState>[SkillsAreLoading()]
            : <SkillState>[
                SkillsHaveFailure(message: failure.message),
              ],
      );
    }
  }
}

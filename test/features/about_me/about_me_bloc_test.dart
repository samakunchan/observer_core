import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/abouts/abouts_dto.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

import '../../server_nestjs/data/fake_datas.dart';
import 'about_me_bloc_test.mocks.dart';

class MockAboutMeBloc extends MockBloc<AboutMeEvent, AboutMeState> implements AboutMeBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([AbstractServerNestjsRepository, AbstractAuthTokenSource])
void main() {
  late MockAboutMeBloc mockAboutMeBloc;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late AuthTokenModel authTokenModel;
  late AboutsDTO aboutsDTO;

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

  group('AboutMeBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockAboutMeBloc = MockAboutMeBloc();
        });
        test('Then it should return [AboutMeInitial] state.', () {
          /// Arrange
          whenListen(
            mockAboutMeBloc,
            Stream.fromIterable([]),
            initialState: AboutMeInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockAboutMeBloc.state, equals(AboutMeInitial()));
        });
      });
    });

    /// LOADED
    group('Given the fact skills are loaded successfully.', () {
      group('When event [AboutMeRequested] is detected.', () {
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockAboutMeBloc,
            Stream.fromIterable([]),
            initialState: const AboutMeIsLoadedSuccessfully(aboutMe: AboutMeModel.emptyDatas),
          );

          /// Act
          const AboutMeEvent event = AboutMeRequested();
          mockAboutMeBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<AboutMeBloc, AboutMeState>(
          'Request successful data.',
          build: AboutMeBloc.new,

          /// Arrange repository
          setUp: () {
            when(
              mockAbstractServerNestjsRepository.getResponses(
                GetParams(
                  endPoint: MainProject.aboutme,
                  accessToken: fakeAuthToken.accessToken,
                ),
              ),
            ).thenAnswer(
              (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
                Right(
                  HttpResponse(
                    [AboutMeModel.emptyDatas.toJson()],
                    Response(
                      requestOptions: RequestOptions(),
                      statusCode: 200,
                    ),
                  ),
                ),
              ),
            );
          },

          /// Act
          act: (AboutMeBloc bloc) => bloc.add(const AboutMeRequested()),

          /// Assert
          expect: () => <AboutMeState>[
            AboutMeIsLoading(),
            const AboutMeIsLoadedSuccessfully(aboutMe: AboutMeModel.emptyDatas),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact skills are loaded successfully.', () {
      group('When event [AboutMeSubmitted] is detected.', () {
        late AboutsDTO fakeDTO;

        setUp(() {
          aboutsDTO = AboutsDTO.fromJson(<String, dynamic>{
            'title': 'fake-title',
            'content': 'fake-content',
          });
        });

        test('Then event should have a aboutMe dto.', () {
          /// Arrange
          whenListen(
            mockAboutMeBloc,
            Stream.fromIterable([]),
            initialState: const AboutMeIsLoadedSuccessfully(aboutMe: AboutMeModel.emptyDatas),
          );

          /// Act
          final AboutMeEvent event = AboutMeSubmitted(aboutsDTO: aboutsDTO);
          mockAboutMeBloc.add(event);

          /// Assert
          expect(event.props, equals([aboutsDTO]));
        });

        blocTest<AboutMeBloc, AboutMeState>(
          'Upsert successful data.',
          build: AboutMeBloc.new,

          /// Arrange repository
          setUp: () {
            fakeDTO = AboutsDTO.fromJson(<String, dynamic>{
              'title': '',
              'content': '',
            });
            when(
              mockAbstractServerNestjsRepository.upsertOne(
                UpsertParams(
                  endPoint: MainProject.aboutme,
                  accessToken: fakeAuthToken.accessToken,
                  body: jsonEncode(fakeDTO.toJson()),
                ),
              ),
            ).thenAnswer(
              (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
                Right(
                  HttpResponse(
                    AboutMeModel.emptyDatas.toJson(),
                    Response(
                      requestOptions: RequestOptions(),
                      statusCode: 200,
                    ),
                  ),
                ),
              ),
            );
          },

          /// Act
          act: (AboutMeBloc bloc) => bloc.add(AboutMeSubmitted(aboutsDTO: fakeDTO)),

          /// Assert
          expect: () => <AboutMeState>[
            const AboutMeIsSubmittingSuccessfully(aboutMe: AboutMeModel.emptyDatas),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        // setUp(() {
        //   mockSkillBloc = MockSkillBloc();
        // });
        testAPIFailures(mockAbstractServerNestjsRepository);
        testFailureUpsert(mockAbstractServerNestjsRepository);
        // testFailureDelete(mockAbstractServerNestjsRepository);
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

  final List<AboutMeEvent> eventsWithGetParams = List<AboutMeEvent>.of([
    const AboutMeRequested(),
  ]);

  for (final AboutMeEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<AboutMeBloc, AboutMeState>(
        'Then it should give [SkillHaveFailure] state for $failure.',
        build: AboutMeBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.aboutme,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (AboutMeBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <AboutMeState>[AboutMeIsLoading()]
            : <AboutMeState>[
                AboutMeIsLoading(),
                AboutMeHasFailure(message: failure.message),
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
    'title': 'fake-title',
    'content': 'fake-content',
  };

  final AboutsDTO aboutsDTO = AboutsDTO.fromJson(fakeJsonDTO);
  final List<AboutMeEvent> eventsWithUpsertParams = List<AboutMeEvent>.of([
    AboutMeSubmitted(
      aboutsDTO: aboutsDTO,
    ),
  ]);

  for (final AboutMeEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<AboutMeBloc, AboutMeState>(
        'Then it should give [SkillHaveFailure] state for $failure.',
        build: AboutMeBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.aboutme,
                body: jsonEncode(aboutsDTO.toJson()),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (AboutMeBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <AboutMeState>[AboutMeIsLoading()]
            : <AboutMeState>[
                AboutMeHasFailure(message: failure.message),
              ],
      );
    }
  }
}

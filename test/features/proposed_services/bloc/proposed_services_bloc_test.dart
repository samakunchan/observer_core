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
import 'proposed_services_bloc_test.mocks.dart';

class MockProposedServicesBloc extends MockBloc<ProposedServicesEvent, ProposedServicesState> implements ProposedServicesBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late UpsertParams upsertParams;
  late DeleteParams deleteParams;
  late ProposedServiceDTO proposedServiceDTO;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late AuthTokenModel authTokenModel;
  late MockProposedServicesBloc mockProposedServicesBloc;
  final Map<String, dynamic> fakeJsonDTO = <String, dynamic>{
    'title': 'fake-title',
    'content': 'fake-content',
    'icon': 'fake-icon',
    'isPublished': false,
  };
  final Map<String, dynamic> fakeJsonModel = <String, dynamic>{
    'id': 999,
    'title': 'fake-title',
    'content': 'fake-content',
    'isPublished': false,
    'createdAt': 'false',
    'updatedAt': 'fake-date',
    'icon': 'fake-icon',
    'deletedAt': 'fake-date',
  };
  final ProposedServiceModel proposedServiceModel = ProposedServiceModel.fromJson(fakeJsonModel);
  late List<ProposedServiceModel> fakeProposedServices;

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

  group('Scenario of ProposedServicesBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockProposedServicesBloc = MockProposedServicesBloc();
        });
        test('Then it should return [ProposedServicesInitial] state.', () {
          /// Arrange
          whenListen(
            mockProposedServicesBloc,
            Stream.fromIterable([]),
            initialState: ProposedServicesInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockProposedServicesBloc.state, equals(ProposedServicesInitial()));
        });
      });
    });

    /// LOADED
    group('Given the fact services are loaded successfully.', () {
      group('When event [ProposedServicesRequested] is detected.', () {
        setUp(() {
          mockProposedServicesBloc = MockProposedServicesBloc();
          fakeProposedServices = [proposedServiceModel];

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.services,
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
          expect(proposedServiceModel.toJson(), isA<Map<String, dynamic>>());
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockProposedServicesBloc,
            Stream.fromIterable([]),
            initialState: ProposedServicesAreLoadedSuccessfully(services: fakeProposedServices),
          );

          /// Act
          const ProposedServicesEvent event = ProposedServicesRequested();
          mockProposedServicesBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<ProposedServicesBloc, ProposedServicesState>(
          'Then it should return [ProposedServicesAreLoadedSuccessfully] state.',
          build: ProposedServicesBloc.new,

          /// Act
          act: (ProposedServicesBloc bloc) => bloc.add(const ProposedServicesRequested()),

          /// Assert
          expect: () => <ProposedServicesState>[
            ProposedServicesAreLoadedSuccessfully(services: fakeProposedServices),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact a service is submitted successfully.', () {
      group('When event [ProposedServicesSubmitted] is detected.', () {
        setUp(() {
          mockProposedServicesBloc = MockProposedServicesBloc();
          proposedServiceDTO = ProposedServiceDTO.fromJson(fakeJsonDTO);

          upsertParams = UpsertParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.services,
            body: jsonEncode(proposedServiceDTO.toJson()),
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
        test('Then event should have a service DTO.', () {
          /// Arrange
          whenListen(
            mockProposedServicesBloc,
            Stream.fromIterable([]),
            initialState: ProposedServiceIsSubmittingSuccessfully(),
          );

          /// Act
          final ProposedServicesEvent event = ProposedServiceSubmitted(proposedServiceDTO: proposedServiceDTO);
          mockProposedServicesBloc.add(event);

          /// Assert
          expect(event.props, equals([proposedServiceDTO]));
        });

        blocTest<ProposedServicesBloc, ProposedServicesState>(
          'Then it should return [ProposedServicesFormIsSubmittedSuccessfully] state.',
          build: ProposedServicesBloc.new,

          /// Act
          act: (ProposedServicesBloc bloc) => bloc.add(ProposedServiceSubmitted(proposedServiceDTO: proposedServiceDTO)),

          /// Assert
          expect: () => <ProposedServicesState>[
            ProposedServiceIsSubmitting(),
            ProposedServiceIsSubmittingSuccessfully(),
          ],
        );
      });
    });

    /// DELETE
    group('Given the fact a service is deleted successfully.', () {
      group('When event [ProposedServiceDeleted] is detected.', () {
        setUp(() {
          mockProposedServicesBloc = MockProposedServicesBloc();

          deleteParams = DeleteParams(
            accessToken: authTokenModel.accessToken,
            body: '999',
            endPoint: MainProject.services,
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
                    'message': 'Fake service deleted',
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      'message': 'Fake service deleted',
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
            mockProposedServicesBloc,
            Stream.fromIterable([]),
            initialState: ProposedServiceIsRemovedSuccessfully(),
          );

          /// Act
          const ProposedServicesEvent event = ProposedServiceDeleted(id: 999);
          mockProposedServicesBloc.add(event);

          /// Assert
          expect(event.props, equals([999]));
        });

        blocTest<ProposedServicesBloc, ProposedServicesState>(
          'Then it should return [ProposedServiceIsRemovedSuccessfully] state.',
          build: ProposedServicesBloc.new,

          /// Act
          act: (ProposedServicesBloc bloc) => bloc.add(const ProposedServiceDeleted(id: 999)),

          /// Assert
          expect: () => <ProposedServicesState>[
            ProposedServiceIsRemovedSuccessfully(),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockProposedServicesBloc = MockProposedServicesBloc();
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

  final List<ProposedServicesEvent> eventsWithGetParams = List<ProposedServicesEvent>.of([
    const ProposedServicesRequested(),
  ]);

  for (final ProposedServicesEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<ProposedServicesBloc, ProposedServicesState>(
        'Then it should give [ProposedServicesHaveFailure] state for $failure.',
        build: ProposedServicesBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.services,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ProposedServicesBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ProposedServicesState>[ProposedServicesAreLoading()]
            : <ProposedServicesState>[
                ProposedServicesHaveFailure(message: failure.message),
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
    'icon': 'fake-icon',
    'isPublished': false,
  };

  final ProposedServiceDTO proposedServiceDTO = ProposedServiceDTO.fromJson(fakeJsonDTO);
  final List<ProposedServicesEvent> eventsWithUpsertParams = List<ProposedServicesEvent>.of([
    ProposedServiceSubmitted(
      proposedServiceDTO: proposedServiceDTO,
    ),
  ]);

  for (final ProposedServicesEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<ProposedServicesBloc, ProposedServicesState>(
        'Then it should give [ProposedServicesHaveFailure] state for $failure.',
        build: ProposedServicesBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.services,
                body: jsonEncode(proposedServiceDTO.toJson()),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ProposedServicesBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ProposedServicesState>[
                ProposedServiceIsSubmitting(),
                ProposedServicesAreLoading(),
              ]
            : <ProposedServicesState>[
                ProposedServiceIsSubmitting(),
                ProposedServicesHaveFailure(message: failure.message),
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

  final List<ProposedServicesEvent> eventsWithDeleteParams = List<ProposedServicesEvent>.of([
    const ProposedServiceDeleted(id: 999),
  ]);

  for (final ProposedServicesEvent event in eventsWithDeleteParams) {
    for (final Failure failure in failures) {
      blocTest<ProposedServicesBloc, ProposedServicesState>(
        'Then it should give [ProposedServicesHaveFailure] state for $failure.',
        build: ProposedServicesBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              DeleteParams(
                accessToken: fakeAuthToken.accessToken,
                body: '999',
                endPoint: MainProject.services,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ProposedServicesBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ProposedServicesState>[ProposedServicesAreLoading()]
            : <ProposedServicesState>[
                ProposedServicesHaveFailure(message: failure.message),
              ],
      );
    }
  }
}

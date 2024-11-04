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
import 'project_bloc_test.mocks.dart';

class MockProjectBloc extends MockBloc<ProjectEvent, ProjectState> implements ProjectBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late UpsertParams upsertParams;
  late DeleteParams deleteParams;
  late ProjectDTO projectDTOForUpsert;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late AuthTokenModel authTokenModel;
  late MockProjectBloc mockProjectBloc;
  final Map<String, dynamic> fakeJsonProject = <String, dynamic>{
    'title': 'Fake title',
    'slug': 'fake-title',
    'shortDescription': 'Fake description',
    'fullDescription': 'Fake description',
    'client': 'Fake client',
    'dateDebutProjet': '2023-01-01T00:00:00.000Z',
    'category': <String, dynamic>{
      'id': 999,
      'title': 'fake-title',
      'content': 'fake-content',
      'projects': ProjectModel.emptyList,
    },
    'picturesProject': [
      {
        'id': 1,
        'src': 'fake-src',
        'alt': 'fake-alt',
      },
    ],
    'company': {'siren': 999999999},
    'dateFinProjet': '2024-08-16T09:49:40.651Z',
    'id': 999,
    'isPublicationActive': false,
    'createdAt': '2024-08-16T09:49:40.651Z',
    'updatedAt': '2024-08-16T09:49:40.651Z',
    'deletedAt': null,
  };
  final ProjectModel projectModel = ProjectModel.fromJson(fakeJsonProject);
  late List<ProjectModel> fakeProjects;

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

  group('Scenario of ProjectBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
        });
        test('Then it should return [ProjectInitial] state.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockProjectBloc.state, equals(ProjectInitial()));
        });
      });

      group('When event [ProjectItemEditableActived] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
        });
        test('Then the event should have no props.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectInitial(),
          );

          /// Act
          final ProjectEvent event = ProjectItemEditableActivated();
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectItemIsEditable] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectItemEditableActivated()),

          /// Assert
          expect: () => <ProjectState>[
            ProjectItemIsEditable(),
          ],
        );
      });

      group('When event [ProjectItemEditableCanceled] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
        });
        test('Then the event should have no props.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectInitial(),
          );

          /// Act
          final ProjectEvent event = ProjectItemEditableCanceled();
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectItemIsNotEditable] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectItemEditableCanceled()),

          /// Assert
          expect: () => <ProjectState>[
            ProjectItemIsNotEditable(),
          ],
        );
      });
    });

    /// LOADED
    group('Given the fact projects are loaded successfully.', () {
      group('When event [ProjectsInGridModeTriggered] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
          fakeProjects = [projectModel];

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.categoriesEndPoint,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeJsonProject],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeJsonProject],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then endpoint should be /categories because the page is built from categories collections.', () {
          /// Assert
          expect(
            getParams.endPoint,
            equals(MainProject.categoriesEndPoint),
          );
        });

        test('Then results should be a json.', () {
          /// Assert
          expect(projectModel.toJson(), isA<Map<String, dynamic>>());
        });

        test('Then event should have a list of projects.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectInitial(),
          );

          /// Act
          final ProjectEvent event = ProjectsInGridModeTriggered(projects: fakeProjects);
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeProjects]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectsShowOnGridMode] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectsInGridModeTriggered(projects: fakeProjects)),

          /// Assert
          expect: () => <ProjectState>[
            ProjectsShowOnGridMode(projects: fakeProjects),
          ],
        );
      });

      group('When event [ProjectsInListModeTriggered] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
          fakeProjects = [projectModel];
        });

        test('Then event should have a list of projects.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectsShowOnListMode(projects: fakeProjects),
          );

          /// Act
          final ProjectEvent event = ProjectsInListModeTriggered(projects: fakeProjects);
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeProjects]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectsShowOnListMode] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectsInListModeTriggered(projects: fakeProjects)),

          /// Assert
          expect: () => <ProjectState>[
            ProjectsShowOnListMode(projects: fakeProjects),
          ],
        );
      });

      group('When event [ProjectsFiltered] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
          fakeProjects = [projectModel];
        });

        test('Then event should have a list of projects.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectsShowOnListMode(projects: fakeProjects),
          );

          /// Act
          final ProjectEvent event = ProjectsFiltered(projects: fakeProjects);
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeProjects]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectsShowOnListMode] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectsFiltered(projects: fakeProjects)),

          /// Assert
          expect: () => <ProjectState>[
            ProjectsShowOnListMode(projects: fakeProjects),
          ],
        );
      });

      group('When event [ProjectReloaded] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
          fakeProjects = [projectModel];

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.categoriesEndPoint,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeJsonProject],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeJsonProject],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then endpoint should be /categories because the page is built from categories collections.', () {
          /// Assert
          expect(getParams.endPoint, equals(MainProject.categoriesEndPoint));
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectInitial(),
          );

          /// Act
          final ProjectEvent event = ProjectReloaded();
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectsShowOnGridMode] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectReloaded()),

          /// Assert
          expect: () => <ProjectState>[
            ProjectsShowOnGridMode(projects: fakeProjects),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact a project is submitted successfully.', () {
      group('When event [ProjectSubmitted] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
          projectDTOForUpsert = ProjectDTO.fromJson({
            'title': 'fake-title',
            'shortDescription': 'fake-description',
            'fullDescription': 'fake-description',
            'client': 'fake-client',
            'dateDebutProjet': 'YYYY-MM-DD',
            'dateFinProjet': 'YYYY-MM-DD',
            'category': 3,
            'picturesProject': [
              {
                'id': 1,
                'description': 'Description de l‘image',
              }
            ],
          });

          upsertParams = UpsertParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.projectsEndPoint,
            body: jsonEncode(projectDTOForUpsert.toJson()),
          );

          when(
            mockAbstractServerNestjsRepository.upsertOne(
              upsertParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  fakeJsonProject,
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: fakeJsonProject,
                  ),
                ),
              ),
            ),
          );
        });
        test('Then event should have a project DTO.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectFormIsSubmittedSuccessfully(),
          );

          /// Act
          final ProjectEvent event = ProjectSubmitted(projectDTOForUpsert: projectDTOForUpsert);
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([projectDTOForUpsert]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectFormIsSubmittedSuccessfully] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectSubmitted(projectDTOForUpsert: projectDTOForUpsert)),

          /// Assert
          expect: () => <ProjectState>[
            ProjectFormIsSubmittedSuccessfully(),
          ],
        );
      });

      group('When event [ProjectFormReset] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
        });
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectInitial(),
          );

          /// Act
          final ProjectEvent event = ProjectFormReset();
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectInitial] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(ProjectFormReset()),

          /// Assert
          expect: () => <ProjectState>[
            ProjectInitial(),
          ],
        );
      });
    });

    /// DELETE
    group('Given the fact a project is deleted successfully.', () {
      group('When event [ProjectDeleted] is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();

          deleteParams = DeleteParams(
            accessToken: authTokenModel.accessToken,
            body: '999',
            endPoint: MainProject.projectsEndPoint,
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
                    'message': 'Fake project delected',
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      'message': 'Fake project delected',
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
            mockProjectBloc,
            Stream.fromIterable([]),
            initialState: ProjectIsRemovedSuccessfully(),
          );

          /// Act
          const ProjectEvent event = ProjectDeleted(id: 999);
          mockProjectBloc.add(event);

          /// Assert
          expect(event.props, equals([999]));
        });

        blocTest<ProjectBloc, ProjectState>(
          'Then it should return [ProjectIsRemovedSuccessfully] state.',
          build: ProjectBloc.new,

          /// Act
          act: (ProjectBloc bloc) => bloc.add(const ProjectDeleted(id: 999)),

          /// Assert
          expect: () => <ProjectState>[
            ProjectIsRemovedSuccessfully(),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockProjectBloc = MockProjectBloc();
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
  final Map<String, dynamic> fakeJsonProject = <String, dynamic>{
    'title': 'Fake title',
    'slug': 'fake-title',
    'shortDescription': 'Fake description',
    'fullDescription': 'Fake description',
    'client': 'Fake client',
    'dateDebutProjet': '2023-01-01T00:00:00.000Z',
    'category': <String, dynamic>{
      'id': 999,
      'title': 'fake-title',
      'content': 'fake-content',
      'projects': ProjectModel.emptyList,
    },
    'picturesProject': [
      {
        'id': 1,
        'src': 'fake-src',
        'alt': 'fake-alt',
      },
    ],
    'company': {'siren': 999999999},
    'dateFinProjet': '2024-08-16T09:49:40.651Z',
    'id': 999,
    'isPublicationActive': false,
    'createdAt': '2024-08-16T09:49:40.651Z',
    'updatedAt': '2024-08-16T09:49:40.651Z',
    'deletedAt': null,
  };
  final ProjectModel projectModel = ProjectModel.fromJson(fakeJsonProject);

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

  final List<ProjectEvent> eventsWithGetParams = List<ProjectEvent>.of([
    ProjectsInGridModeTriggered(projects: [projectModel]),
    ProjectReloaded(),
  ]);

  for (final ProjectEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<ProjectBloc, ProjectState>(
        'Then it should give [ProjectHasFailure] state for $failure.',
        build: ProjectBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.categoriesEndPoint,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ProjectBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ProjectState>[ProjectIsLoading()]
            : <ProjectState>[
                ProjectHasFailure(message: failure.message),
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

  final ProjectDTO projectDTOForUpsert = ProjectDTO.fromJson({
    'title': 'fake-title',
    'shortDescription': 'fake-description',
    'fullDescription': 'fake-description',
    'client': 'fake-client',
    'dateDebutProjet': 'YYYY-MM-DD',
    'dateFinProjet': 'YYYY-MM-DD',
    'category': 3,
    'picturesProject': [
      {
        'id': 1,
        'description': 'Description de l‘image',
      }
    ],
  });
  final List<ProjectEvent> eventsWithUpsertParams = List<ProjectEvent>.of([
    ProjectSubmitted(
      projectDTOForUpsert: projectDTOForUpsert,
    ),
  ]);

  for (final ProjectEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<ProjectBloc, ProjectState>(
        'Then it should give [ProjectHasFailure] state for $failure.',
        build: ProjectBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.projectsEndPoint,
                body: jsonEncode(projectDTOForUpsert.toJson()),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ProjectBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ProjectState>[ProjectIsLoading()]
            : <ProjectState>[
                ProjectHasFailure(message: failure.message),
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

  final List<ProjectEvent> eventsWithDeleteParams = List<ProjectEvent>.of([
    const ProjectDeleted(id: 999),
  ]);

  for (final ProjectEvent event in eventsWithDeleteParams) {
    for (final Failure failure in failures) {
      blocTest<ProjectBloc, ProjectState>(
        'Then it should give [ProjectHasFailure] state for $failure.',
        build: ProjectBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              DeleteParams(
                accessToken: fakeAuthToken.accessToken,
                body: '999',
                endPoint: MainProject.projectsEndPoint,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (ProjectBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <ProjectState>[ProjectIsLoading()]
            : <ProjectState>[
                ProjectHasFailure(message: failure.message),
              ],
      );
    }
  }
}

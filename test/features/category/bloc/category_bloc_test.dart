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
import 'package:observer_core/enums/enums_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/category/category_model.dart';
import 'package:observer_core/models/project/project_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../server_nestjs/data/fake_datas.dart';
import 'category_bloc_test.mocks.dart';

class MockCategoryBloc extends MockBloc<CategoryEvent, CategoryState> implements CategoryBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractInMemoryApiNestjsRepository,
  AbstractAuthTokenSource,
  CategoryHandler,
])
void main() {
  late GetParams getParams;
  late UpsertParams upsertParams;
  late DeleteParams deleteParams;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late MockAbstractInMemoryApiNestjsRepository mockAbstractInMemoryApiNestjsRepository;

  late AuthTokenModel authTokenModel;
  late MockCategoryBloc mockCategoryBloc;
  late CategoryUpsertDTO categoryUpsertDTO;
  late CategoryDeleteDTO categoryDeleteDTO;
  final Map<String, dynamic> fakeJson = <String, dynamic>{
    'id': 999,
    'title': 'fake-title',
    'content': 'fake-content',
    'projects': ProjectModel.emptyList,
  };
  final CategoryModel fakeCategoryModel = CategoryModel.fromJson(fakeJson);

  final List<CategoryModel> fakeCategories = List.of([fakeCategoryModel]);

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
        endPoint: MainProject.categoriesEndPoint,
        accessToken: authTokenModel.accessToken,
        body: jsonEncode(fakeCategories),
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

  group('Scenario of CategoryBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
        });
        test('Then it should return [CategoryInitial] state.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([]),
            initialState: CategoryInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockCategoryBloc.state, equals(CategoryInitial()));
        });
      });
    });
    group('Given the fact the categories are reinitialized.', () {
      group('When event [CategoriesInitialized] is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
        });

        test('Then it should have no props.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([CategoryInitial()]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoriesInitialized();
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([]));
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give a [CategoryInitial] state.',
          build: CategoryBloc.new,

          /// Arrange
          setUp: () {},

          /// Act
          act: (CategoryBloc bloc) => bloc.add(CategoriesInitialized()),

          /// Assert
          expect: () => <CategoryState>[
            CategoryInitial(),
          ],
        );
      });
    });

    /// SUCCESSFULLY LOADED
    group('Given the fact the categories are loaded successfully.', () {
      /// GRID LOCAL
      group('When event [CategoriesInGridRequestedInMemory] event is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          getParams = GetParams(
            endPoint: MainProject.categoriesEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange Local
          when(
            mockAbstractInMemoryApiNestjsRepository.getResponses(getParams),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
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
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of categories.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoriesInGridRequestedInMemory(
            categories: fakeCategories,
          );
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategories]));
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoryIsLoading] and [CategoriesAreLoadedSuccessfully] states.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoriesInGridRequestedInMemory(
              categories: fakeCategories,
            ),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesInMemoryAreLoadedSuccessfully(categories: fakeCategories),
          ],
        );
      });

      /// GRID API
      group('When event [CategoriesInGridRequested] event is detectedI.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          getParams = GetParams(
            endPoint: MainProject.categoriesEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of categories.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoriesInGridRequested(categories: fakeCategories);
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategories]));
        });

        test('Then it should an HTTPResponse.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.getResponses(
            getParams,
          );

          /// Assert
          switch (responses) {
            case Right():
              final List<dynamic> list = responses.value.response.data as List<dynamic>;
              final List<Map<String, dynamic>> datasJson = list.map((e) => e as Map<String, dynamic>).toList();
              final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
              expect(categories, isA<List<CategoryModel>>());
          }
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoriesAreLoadedSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoriesInGridRequested(categories: fakeCategories),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesAreLoadedSuccessfully(categories: fakeCategories, selectedId: 1),
          ],
        );
      });

      /// LIST LOCAL
      group('When event [CategoriesInListRequestedInMemory] event is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          getParams = GetParams(
            endPoint: MainProject.categoriesEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange Local
          when(
            mockAbstractInMemoryApiNestjsRepository.getResponses(getParams),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
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
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of categories.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoriesInListRequestedInMemory(
            categories: fakeCategories,
          );
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategories]));
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoryIsLoading] and [CategoriesAreLoadedSuccessfully] states.',
          build: CategoryBloc.new,

          /// Arrange
          setUp: () {},

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoriesInListRequestedInMemory(
              categories: fakeCategories,
            ),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesInMemoryAreLoadedSuccessfully(categories: fakeCategories),
          ],
        );
      });

      /// LIST API
      group('When event [CategoriesInListRequested] event is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          getParams = GetParams(
            endPoint: MainProject.categoriesEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of categories.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoriesInListRequested(categories: fakeCategories);
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategories]));
        });

        test('Then it should an HTTPResponse.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.getResponses(
            getParams,
          );

          /// Assert
          switch (responses) {
            case Right():
              final List<dynamic> list = responses.value.response.data as List<dynamic>;
              final List<Map<String, dynamic>> datasJson = list.map((e) => e as Map<String, dynamic>).toList();
              final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
              expect(categories, isA<List<CategoryModel>>());
          }
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoriesAreLoadedSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoriesInListRequested(categories: fakeCategories),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesAreLoadedSuccessfully(categories: fakeCategories, selectedId: 1),
          ],
        );
      });

      /// SELECTED
      group('When event [CategoriesSelected] event is detected.', () {
        test('Then the props should contain a list of categories and a filterId.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoriesAreFilteredSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategorySelected(
            categories: fakeCategories,
            filterId: 1,
          );
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategories, 1]));
        });

        test('Then it should an HTTPResponse.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.getResponses(
            getParams,
          );

          /// Assert
          switch (responses) {
            case Right():
              final List<dynamic> list = responses.value.response.data as List<dynamic>;
              final List<Map<String, dynamic>> datasJson = list.map((e) => e as Map<String, dynamic>).toList();
              final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
              expect(categories, isA<List<CategoryModel>>());
          }
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoriesAreFilteredSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategorySelected(
              categories: fakeCategories,
              filterId: 1,
            ),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesAreFilteredSuccessfully(
              categories: fakeCategories,
              selectedId: 1,
              filteredCategories: [],
            )
          ],
        );
      });

      /// RELOAD
      group('When event [CategoriesReloaded] event is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          getParams = GetParams(
            endPoint: MainProject.categoriesEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should be empty.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoriesReloaded();
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([]));
        });

        test('Then it should an HTTPResponse.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.getResponses(
            getParams,
          );

          /// Assert
          switch (responses) {
            case Right():
              final List<dynamic> list = responses.value.response.data as List<dynamic>;
              final List<Map<String, dynamic>> datasJson = list.map((e) => e as Map<String, dynamic>).toList();
              final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
              expect(categories, isA<List<CategoryModel>>());
          }
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoriesAreLoadedSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoriesReloaded(),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesAreLoadedSuccessfully(categories: fakeCategories, selectedId: 1),
          ],
        );
      });

      /// FILTERED
      group('When event [CategoryFiltered] event is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          getParams = GetParams(
            endPoint: MainProject.categoriesEndPoint,
            accessToken: fakeAuthToken.accessToken,
          );

          /// Arrange
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a list of categories, the name of filter and the screen mode.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoryFiltered(
            selectedId: 1,
            categories: fakeCategories,
            filterInText: 'filter',
          );
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategories, 'filter', ScreenMode.grid]));
        });

        test('Then it should an HTTPResponse.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.getResponses(
            getParams,
          );

          /// Assert
          switch (responses) {
            case Right():
              final List<dynamic> list = responses.value.response.data as List<dynamic>;
              final List<Map<String, dynamic>> datasJson = list.map((e) => e as Map<String, dynamic>).toList();
              final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
              expect(categories, isA<List<CategoryModel>>());
          }
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoriesAreFilteredSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoryFiltered(
              selectedId: 1,
              categories: fakeCategories,
              filterInText: 'filter',
            ),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoriesAreFilteredSuccessfully(categories: fakeCategories, selectedId: 1),
          ],
        );
      });
    });

    /// SUCCESSFULLY SUBMITTED
    group('Given the fact that one category is submitted', () {
      /// UPSERT
      group('When event [CategorySubmitted] event is detectedI.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          categoryUpsertDTO = CategoryUpsertDTO.fromJson(<String, dynamic>{
            'title': 'title',
            'content': 'content',
            'environment': 1,
          });
          upsertParams = UpsertParams(
            accessToken: fakeAuthToken.accessToken,
            endPoint: MainProject.categoriesEndPoint,
            body: jsonEncode(categoryUpsertDTO.toJson()),
          );

          /// Arrange
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              upsertParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should contain a list of categories.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryInitial(),
              CategoryIsLoading(),
              CategoriesAreLoadedSuccessfully(selectedId: 1, categories: fakeCategories),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategorySubmitted(categoryForUpsert: categoryUpsertDTO);
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([categoryUpsertDTO]));
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoriesAreLoadedSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategorySubmitted(
              categoryForUpsert: CategoryUpsertDTO.fromJson(<String, dynamic>{
                'title': 'title',
                'content': 'content',
                'environment': 1,
              }),
            ),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoryFormIsSubmittedSuccessfully(),
          ],
        );
      });
    });

    /// SUCCESSFULLY DELETED
    group('Given the fact that one category is deleted', () {
      /// DELETE
      group('When event [CategoryDeleted] event is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
          categoryDeleteDTO = CategoryDeleteDTO.fromJson({
            'categoriesIds': [fakeCategoryModel.id],
          });
          deleteParams = DeleteParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.categoriesEndPoint,
            body: jsonEncode(categoryDeleteDTO),
          );

          /// Arrange
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              deleteParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [fakeCategoryModel.toJson()],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: [fakeCategoryModel.toJson()],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a list of categories.', () {
          /// Arrange
          whenListen(
            mockCategoryBloc,
            Stream.fromIterable([
              CategoryIsDeletedSuccessfully(categoryDeleted: fakeCategoryModel),
            ]),
            initialState: CategoryInitial(),
          );

          /// Act
          final CategoryEvent categoryEvent = CategoryDeleted(categoryForDelete: fakeCategoryModel);
          mockCategoryBloc.add(categoryEvent);

          /// Assert
          expect(categoryEvent.props, equals([fakeCategoryModel]));
        });

        test('Then it should an HTTPResponse.', () async {
          /// Act
          final Either<Failure, HttpResponse<dynamic>> responses = await mockAbstractServerNestjsRepository.deleteOne(
            deleteParams,
          );

          /// Assert
          switch (responses) {
            case Right():
              final List<dynamic> list = responses.value.response.data as List<dynamic>;
              final List<Map<String, dynamic>> datasJson = list.map((e) => e as Map<String, dynamic>).toList();
              final List<CategoryModel> categories = datasJson.map<CategoryModel>(CategoryModel.fromJson).toList();
              expect(categories, isA<List<CategoryModel>>());
          }
        });

        blocTest<CategoryBloc, CategoryState>(
          'Then it should give [CategoryIsDeletedSuccessfully] state.',
          build: CategoryBloc.new,

          /// Act
          act: (CategoryBloc bloc) => bloc.add(
            CategoryDeleted(categoryForDelete: fakeCategoryModel),
          ),

          /// Assert
          expect: () => <CategoryState>[
            CategoryIsLoading(),
            CategoryIsDeletedSuccessfully(categoryDeleted: fakeCategoryModel),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      /// GRID API
      group('When event any requests is detected.', () {
        setUp(() {
          mockCategoryBloc = MockCategoryBloc();
        });

        testAllFailures(mockAbstractServerNestjsRepository, fakeCategories);
      });
    });
  });
}

void testAllFailures(
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
  List<CategoryModel> fakeCategories,
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

  final List<CategoryEvent> eventsWithGetParams = List<CategoryEvent>.of([
    CategoriesInGridRequested(categories: fakeCategories),
    CategoriesInListRequested(categories: fakeCategories),
    CategoriesReloaded(),
  ]);

  final List<CategoryEvent> eventsWithPostParams = List<CategoryEvent>.of([
    CategorySubmitted(
      categoryForUpsert: CategoryUpsertDTO.fromJson(<String, dynamic>{
        'title': 'title',
        'content': 'content',
        'environment': 1,
      }),
    ),
  ]);

  final Map<String, dynamic> fakeJson = <String, dynamic>{
    'id': 999,
    'title': 'fake-title',
    'content': 'fake-content',
    'projects': ProjectModel.emptyList,
  };
  final CategoryModel fakeCategoryModel = CategoryModel.fromJson(fakeJson);

  final List<CategoryEvent> eventsWithDeleteParams = List<CategoryEvent>.of([
    CategoryDeleted(categoryForDelete: fakeCategoryModel),
  ]);

  for (final CategoryEvent event in eventsWithGetParams) {
    testFailuresWithGetParams(event, failures, mockAbstractServerNestjsRepository, fakeCategories);
  }

  for (final CategoryEvent event in eventsWithPostParams) {
    testFailuresWithUpsertParams(event, failures, mockAbstractServerNestjsRepository, fakeCategories);
  }

  for (final CategoryEvent event in eventsWithDeleteParams) {
    testFailuresWithDeleteParams(event, failures, mockAbstractServerNestjsRepository, fakeCategories, fakeCategoryModel);
  }
}

void testFailuresWithGetParams(
  CategoryEvent event,
  List<Failure> failures,
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
  List<CategoryModel> fakeCategories,
) {
  for (final Failure failure in failures) {
    blocTest<CategoryBloc, CategoryState>(
      'Then it should give [CategoriesHaveFailures] state for $failure.',
      build: CategoryBloc.new,

      /// Arrange
      setUp: () {
        when(
          mockAbstractServerNestjsRepository.getResponses(
            GetParams(
              endPoint: MainProject.categoriesEndPoint,
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
      act: (CategoryBloc bloc) => bloc.add(event),

      /// Assert
      expect: () => failure == UnExpectedFailure()
          ? <CategoryState>[CategoryIsLoading()]
          : <CategoryState>[
              CategoriesHaveFailures(message: failure.message),
            ],
    );
  }
}

void testFailuresWithUpsertParams(
  CategoryEvent event,
  List<Failure> failures,
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
  List<CategoryModel> fakeCategories,
) {
  for (final Failure failure in failures) {
    blocTest<CategoryBloc, CategoryState>(
      'Then it should give [CategoriesHaveFailures] state for $failure.',
      build: CategoryBloc.new,

      /// Arrange
      setUp: () {
        final CategoryUpsertDTO categoryUpsertDTO = CategoryUpsertDTO.fromJson(<String, dynamic>{
          'title': 'title',
          'content': 'content',
          'environment': 1,
        });
        when(
          mockAbstractServerNestjsRepository.upsertOne(
            UpsertParams(
              accessToken: fakeAuthToken.accessToken,
              endPoint: MainProject.categoriesEndPoint,
              body: jsonEncode(categoryUpsertDTO.toJson()),
            ),
          ),
        ).thenAnswer(
          (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
            Left(failure),
          ),
        );
      },

      /// Act
      act: (CategoryBloc bloc) => bloc.add(event),

      /// Assert
      expect: () => failure == UnExpectedFailure()
          ? <CategoryState>[CategoryIsLoading()]
          : <CategoryState>[
              CategoriesHaveFailures(message: failure.message),
            ],
    );
  }
}

void testFailuresWithDeleteParams(
  CategoryEvent event,
  List<Failure> failures,
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
  List<CategoryModel> fakeCategories,
  CategoryModel fakeCategoryModel,
) {
  for (final Failure failure in failures) {
    blocTest<CategoryBloc, CategoryState>(
      'Then it should give [CategoriesHaveFailures] state for $failure.',
      build: CategoryBloc.new,

      /// Arrange
      setUp: () {
        final categoryDeleteDTO = CategoryDeleteDTO.fromJson({
          'categoriesIds': [fakeCategoryModel.id],
        });

        when(
          mockAbstractServerNestjsRepository.deleteOne(
            DeleteParams(
              accessToken: fakeAuthToken.accessToken,
              endPoint: MainProject.categoriesEndPoint,
              body: jsonEncode(categoryDeleteDTO),
            ),
          ),
        ).thenAnswer(
          (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
            Left(failure),
          ),
        );
      },

      /// Act
      act: (CategoryBloc bloc) => bloc.add(event),

      /// Assert
      expect: () => failure == UnExpectedFailure()
          ? <CategoryState>[CategoryIsLoading()]
          : <CategoryState>[
              CategoryIsLoading(),
              CategoriesHaveFailures(message: failure.message),
            ],
    );
  }
}

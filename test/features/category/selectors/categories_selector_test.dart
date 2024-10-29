import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';

import '../bloc/category_bloc_test.dart';

@GenerateMocks([])
void main() {
  late MockCategoryBloc mockCategoryBloc;
  late CategoriesSelector categoriesSelector;

  final Map<String, dynamic> fakeJson = <String, dynamic>{
    'id': 999,
    'title': 'fake-title',
    'content': 'fake-content',
    'projects': ProjectModel.emptyList,
    'environment': <String, dynamic>{
      'id': 999,
      'title': 'Portfolio',
    },
  };
  final CategoryModel fakeCategoryModel = CategoryModel.fromJson(fakeJson);

  final List<CategoryModel> fakeCategories = List.of([fakeCategoryModel]);
  group('Given a widget CategoriesSelector.', () {
    group('When categories are successfully loaded or filtered.', () {
      setUp(() {
        mockCategoryBloc = MockCategoryBloc();
        categoriesSelector = CategoriesSelector(
          idCategoryProject: 999,
          onInit: (CategoryModel category) {},
          builder: (BuildContext context, List<CategoryModel> categories) => const Text(
            'List of categories',
          ),
        );
      });

      testWidgets('Then it should render a child widget with a list of categories.', (WidgetTester tester) async {
        /// Act
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<CategoryBloc>(
              create: (_) => CategoryBloc(),
              child: categoriesSelector,
            ),
          ),
        );

        /// Assert
        expect(find.text('List of categories'), findsOneWidget);
      });

      test('Then it should select CategoriesAreLoadedSuccessfully and return a list of all categories.', () {
        /// Arrange
        whenListen(
          mockCategoryBloc,
          Stream.fromIterable([
            CategoriesAreLoadedSuccessfully(selectedId: 999, categories: fakeCategories),
          ]),
          initialState: CategoriesAreLoadedSuccessfully(selectedId: 999, categories: fakeCategories),
        );

        /// Act
        categoriesSelector.getListCategories(CategoriesAreLoadedSuccessfully(selectedId: 999, categories: fakeCategories));

        /// Assert
        expect(mockCategoryBloc.state, CategoriesAreLoadedSuccessfully(selectedId: 999, categories: fakeCategories));
      });

      test('Then it should select CategoriesAreFilteredSuccessfully and return a list of all categories.', () {
        /// Arrange
        whenListen(
          mockCategoryBloc,
          Stream.fromIterable([
            CategoriesAreFilteredSuccessfully(selectedId: 999, categories: fakeCategories),
          ]),
          initialState: CategoriesAreFilteredSuccessfully(selectedId: 999, categories: fakeCategories),
        );

        /// Act
        categoriesSelector.getListCategories(CategoriesAreFilteredSuccessfully(selectedId: 999, categories: fakeCategories));

        /// Assert
        expect(mockCategoryBloc.state, CategoriesAreFilteredSuccessfully(selectedId: 999, categories: fakeCategories));
      });
    });
  });
}

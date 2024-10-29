import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observer_core/features/category/bloc/category_bloc.dart';
import 'package:observer_core/features/category/selectors/categories_offline_selector.dart';

void main() {
  group('Given a widget CategoriesAreLoadedSelector.', () {
    group('When the server is offline.', () {
      testWidgets('Then it should render a child widget for offline server.', (WidgetTester tester) async {
        /// Act
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<CategoryBloc>(
              create: (_) => CategoryBloc(),
              child: CategoriesOfflineSelector(
                builder: (BuildContext context, bool isServerFailure) => const Text(
                  'Server offline',
                ),
              ),
            ),
          ),
        );

        /// Assert
        expect(find.text('Server offline'), findsOneWidget);
      });
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observer_core/features/features_export.dart';

void main() {
  const String text = 'Affichage du total';
  group('Given a widget DocumentsAreLoadedSelector.', () {
    group('When all document are loaded and total is not equals to -1.', () {
      testWidgets('Then it should render a child widget.', (WidgetTester tester) async {
        /// Act
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<DocumentBloc>(
              create: (_) => DocumentBloc(),
              child: DocumentsTotalSelector(
                builder: (_, int total) {
                  return const Text(text);
                },
              ),
            ),
          ),
        );

        /// Assert
        expect(find.text(text), findsOneWidget);
      });
    });
  });
}

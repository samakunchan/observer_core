import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observer_core/features/features_export.dart';

void main() {
  const String text = 'J‘ai un résultat';

  group('Given a widget DocumentSelectedResultsSelector.', () {
    group('When multiple documents are found.', () {
      testWidgets('Then it should render a child widget.', (WidgetTester tester) async {
        /// Act
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<DocumentActionPageBloc>(
              create: (_) => DocumentActionPageBloc()..add(const DocumentPageResultsUpdated(results: [1])),
              child: DocumentSelectedResultsSelector(
                builder: (_, List<int>? results) {
                  /// Je force le résultat
                  results = [1];
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

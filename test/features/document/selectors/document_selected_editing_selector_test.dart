import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';

void main() {
  const String text = 'Je suis un document';
  group('Given a widget DocumentSelectedEditingSelector.', () {
    group('When a document is editable.', () {
      testWidgets('Then it should render a child widget.', (WidgetTester tester) async {
        /// Act
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<DocumentInfosBloc>(
              create: (_) => DocumentInfosBloc(),
              child: DocumentSelectedEditingSelector(
                builder: (_, DocumentModel document) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observer_core/features/environment/feature_environment_export.dart';

void main() {
  group('Given a widget EnvServerOfflineSelector.', () {
    group('When the server is offline.', () {
      testWidgets('Then it should render a child widget for offline server.', (WidgetTester tester) async {
        /// Act
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<EnvironmentStoreBloc>(
              create: (_) => EnvironmentStoreBloc(),
              child: EnvServerOfflineSelector(
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

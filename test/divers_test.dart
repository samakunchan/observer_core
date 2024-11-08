import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/dtos/dtos_export.dart';
import 'package:observer_core/utils.dart';
import 'package:path/path.dart' as path;

import 'divers_test.mocks.dart';

@GenerateMocks([File])
void main() {
  late MockFile mockFile;
  late String fakePathFile;
  group('Given the KWidget.', () {
    group('When an toogle is detected.', () {
      testWidgets('Then toogleSidebar renders correctly and toggles sidebar when pressed', (WidgetTester tester) async {
        bool sidebarToggled = false;

        await tester.pumpWidget(
          MacosApp(
            home: MacosWindowScope(
              constraints: const BoxConstraints(maxWidth: 800, maxHeight: 600),
              isSidebarShown: true,
              isEndSidebarShown: false,
              sidebarToggler: () {
                sidebarToggled = true;
              },
              endSidebarToggler: () {},
              child: const Builder(
                builder: KWidget.toogleSidebar,
              ),
            ),
          ),
        );

        // Verify that the button is rendered
        expect(find.byType(MacosIconButton), findsOneWidget);

        // Verify the constraints
        final MacosIconButton button = tester.widget<MacosIconButton>(find.byType(MacosIconButton));
        expect(button.boxConstraints.minHeight, 20);
        expect(button.boxConstraints.minWidth, 20);
        expect(button.boxConstraints.maxWidth, 48);
        expect(button.boxConstraints.maxHeight, 38);

        // Tap the button
        await tester.tap(find.byType(MacosIconButton));
        await tester.pump();

        // Verify that toggleSidebar was called
        expect(sidebarToggled, isTrue);
      });
    });

    group('When an error is detected.', () {
      testWidgets('Then it should render the widget', (WidgetTester tester) async {
        await tester.pumpWidget(
          MacosApp(
            home: KWidget.alloBossIHaveAProblem('message'),
          ),
        );

        expect(find.byType(Text), findsOneWidget);
        expect(find.text('message'), findsOneWidget);
      });
    });
  });

  group('Given utils methods.', () {
    /// getCountAxis
    group('When getCountAxis method is called.', () {
      test('Then it should return 4 if the contentSizeArea is above 1600.', () {
        final int result = getCountAxis(sizeContentArea: 1601);

        expect(result, 4);
      });

      test('Then it should return 3 if the contentSizeArea is between 1001 and 1600.', () {
        final int result = getCountAxis(sizeContentArea: 1001);

        expect(result, 3);
      });

      test('Then it should return 2 if the contentSizeArea is 100.', () {
        final int result = getCountAxis(sizeContentArea: 100);

        expect(result, 2);
      });
    });

    /// getAspectRatio
    group('When getAspectRatio method is called.', () {
      test('Then it should return 1.2 if the contentSizeArea is above 1200.', () {
        final double result = getAspectRatio(sizeContentArea: 1201);

        expect(result, 1.2);
      });

      test('Then it should return 1 if the contentSizeArea is 100.', () {
        final double result = getAspectRatio(sizeContentArea: 100);

        expect(result, 1);
      });
    });

    /// Dates
    group('For all Dates.', () {
      /// getAspectRatio
      group('When formatDate method is called.', () {
        setUp(() async {
          await initializeDateFormatting('fr_FR');
        });

        test('Then it should return a french formatted date.', () {
          final String formattedDate = formatDate('2024-09-29T00:00:00.000Z');

          expect(formattedDate, equals('29 septembre 2024'));
        });
      });
      group('When formatFullDate method is called.', () {
        setUp(() async {
          await initializeDateFormatting('fr_FR');
        });

        test('Then it should return a french formatted date with the day.', () {
          final String formattedDate = formatFullDate('2024-09-29T00:00:00.000Z');

          expect(formattedDate, equals('dimanche 29 septembre 2024'));
        });
      });
      group('When formatCommonDate method is called.', () {
        setUp(() async {
          await initializeDateFormatting('fr_FR');
        });

        test('Then it should return a date DTO.', () {
          final DateDTO dateDTO = formatCommonDate('2024-09-29T00:00:00.000Z');

          expect(dateDTO, isA<DateDTO>());
          expect(dateDTO.dateFormated, equals('29/09/2024'));
          expect(dateDTO.dateTime, equals(DateTime.parse('2024-09-29T00:00:00.000Z')));
        });
      });
      group('When unFormatFullDate method is called.', () {
        setUp(() async {
          await initializeDateFormatting('fr_FR');
        });

        test('Then it should return a unformatted date.', () {
          final String unFormattedDate = unFormatFullDate('2024-09-29T00:00:00.000Z');

          expect(unFormattedDate, equals('29/09/2024'));
        });
      });
    });

    /// Logger
    group('When logger variable is called.', () {
      test('Then it should return an instance of Logger.', () {
        expect(logger, isA<Logger>());
      });
    });

    group('For all Files.', () {
      /// Mimetype
      group('When getMimeType method is called.', () {
        test('Then it should return a mimetype.', () {
          final String? mimetype = getMimeType(file: 'image.png');
          expect(mimetype, equals('image/png'));
        });
      });

      /// FormData
      group('When getFormDataOneFile method is called.', () {
        setUp(() async {
          mockFile = MockFile();

          final String projectDir = Directory.current.path;

          fakePathFile = path.join(projectDir, 'test/test_resources', 'file-to-unit-test.txt');
          if (!File(fakePathFile).existsSync()) {
            fail('Le fichier de test n‘existe pas : $fakePathFile');
          }

          when(mockFile.path).thenReturn(fakePathFile);
          when(await mockFile.length()).thenAnswer((_) => 8);
          when(mockFile.lengthSync()).thenReturn(1024);
        });

        test('Then it should return a future FormData for multiple files.', () async {
          final FormData formData = await getFormDataMultipleFile(files: [mockFile.path]);
          expect(formData, isA<FormData>());
        });
      });
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/document/document_model.dart';

class MockDocumentActionPageBloc extends MockBloc<DocumentActionPageEvent, DocumentActionPageState> implements DocumentActionPageBloc {}

void main() {
  late MockDocumentActionPageBloc mockDocumentActionPageBloc;
  group('Given the fact the bloc is started.', () {
    group('When the bloc is in initial state.', () {
      setUp(() {
        mockDocumentActionPageBloc = MockDocumentActionPageBloc();
      });
      test('Then it should return [DocumentActionPageInitial] state.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        // no act

        /// Assert
        expect(mockDocumentActionPageBloc.state, equals(DocumentActionPageInitial()));
      });
    });
  });
  group('Given the fact a page can be editable.', () {
    group('When event [DocumentPageEditableActivated] is detected.', () {
      test('Then event should have no props.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        final DocumentActionPageEvent event = DocumentPageEditableActivated();
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(event.props, equals([]));
      });

      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should authorize the edition of the page.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(DocumentPageEditableActivated()),

        /// Assert
        expect: () => <DocumentActionPageState>[
          DocumentPageIsEditable(),
        ],
      );
    });

    group('When event [DocumentPageEditableCancelled] is detected.', () {
      test('Then event should have no props.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        final DocumentActionPageEvent event = DocumentPageEditableCancelled();
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(event.props, equals([]));
      });

      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should cancel the edition of the page.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(DocumentPageEditableCancelled()),

        /// Assert
        expect: () => <DocumentActionPageState>[
          DocumentPageIsNotEditable(),
        ],
      );
    });

    group('When event [DocumentPageItemSelected] is detected.', () {
      test('Then event should have one document.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        const DocumentActionPageEvent event = DocumentPageItemSelected(document: DocumentModel.empty);
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(event.props, equals([DocumentModel.empty]));
      });
      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should select one document.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(const DocumentPageItemSelected(document: DocumentModel.empty)),

        /// Assert
        expect: () => <DocumentActionPageState>[
          const DocumentPageItemIsChecked(document: DocumentModel.empty),
        ],
      );
    });

    group('When event [DocumentPageItemUnSelected] is detected.', () {
      test('Then event should have one document.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        const DocumentActionPageEvent event = DocumentPageItemUnSelected(document: DocumentModel.empty);
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(event.props, equals([DocumentModel.empty]));
      });
      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should unselect one document.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(const DocumentPageItemUnSelected(document: DocumentModel.empty)),

        /// Assert
        expect: () => <DocumentActionPageState>[
          const DocumentPageItemIsUnChecked(document: DocumentModel.empty),
        ],
      );
    });

    group('When event [DocumentPageResultsUpdated] is detected.', () {
      test('Then event should have a list of integer.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        const DocumentActionPageEvent event = DocumentPageResultsUpdated(results: [1]);
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(
            event.props,
            equals([
              [1]
            ]));
      });

      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should a give a list of integer about all documents selected.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(const DocumentPageResultsUpdated(results: [1])),

        /// Assert
        expect: () => <DocumentActionPageState>[
          const DocumentPageListSelected(results: [1]),
        ],
      );
    });

    group('When event [DocumentPageAllSelected] is detected.', () {
      test('Then event should have no props.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        final DocumentActionPageEvent event = DocumentPageAllSelected();
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(event.props, equals([]));
      });

      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should select all documents.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(DocumentPageAllSelected()),

        /// Assert
        expect: () => <DocumentActionPageState>[
          DocumentPageAllItemsAreSelected(),
        ],
      );
    });

    group('When event [DocumentPageAllCanceled] is detected.', () {
      test('Then event should have no props.', () {
        /// Arrange
        whenListen(
          mockDocumentActionPageBloc,
          Stream.fromIterable([]),
          initialState: DocumentActionPageInitial(),
        );

        /// Act
        final DocumentActionPageEvent event = DocumentPageAllCanceled();
        mockDocumentActionPageBloc.add(event);

        /// Assert
        expect(event.props, equals([]));
      });

      blocTest<DocumentActionPageBloc, DocumentActionPageState>(
        'Then it should unselect all documents.',
        build: DocumentActionPageBloc.new,

        /// Act
        act: (DocumentActionPageBloc bloc) => bloc.add(DocumentPageAllCanceled()),

        /// Assert
        expect: () => <DocumentActionPageState>[
          DocumentPageAllItemsAreUnSelected(),
        ],
      );
    });
  });
}

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
import 'package:observer_core/models/document/document_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../server_nestjs/data/fake_datas.dart';
import 'document_infos_bloc_test.mocks.dart';

class MockDocumentInfosBloc extends MockBloc<DocumentInfosEvent, DocumentInfosState> implements DocumentInfosBloc {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late MockDocumentInfosBloc mockDocumentInfosBloc;
  late OneDocumentUpsertDTO oneDocumentUpsertDTO;
  late UpsertParams upsertParams;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  mockAbstractAuthTokenSource = MockAbstractAuthTokenSource();
  mockAbstractServerNestjsRepository = MockAbstractServerNestjsRepository();

  /// Création du stub pour les singletons
  GetIt.instance.registerSingleton<AbstractAuthTokenSource>(mockAbstractAuthTokenSource);
  GetIt.instance.registerSingleton<AbstractServerNestjsRepository>(mockAbstractServerNestjsRepository);

  /// Arrange token
  when(
    mockAbstractAuthTokenSource.getAuthToken(),
  ).thenAnswer(
    (_) => Future<AuthTokenModel>.value(fakeAuthToken),
  );

  group('Scenario of DocumentInfosBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When the bloc is in initial state.', () {
        setUp(() {
          mockDocumentInfosBloc = MockDocumentInfosBloc();
        });
        test('Then it should return [DocumentInfosInitial] state.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockDocumentInfosBloc.state, equals(DocumentInfosInitial()));
        });
      });
      group('When the bloc is loading.', () {
        setUp(() {
          mockDocumentInfosBloc = MockDocumentInfosBloc();
        });
        test('Then it should return [DocumentInfosIsLoading] state.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosIsLoading(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockDocumentInfosBloc.state, equals(DocumentInfosIsLoading()));
        });
      });
    });
    group('Given the fact a page can be shown.', () {
      group('When event [DocumentSelected] is detected.', () {
        test('Then event should have a document selected.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          const DocumentInfosEvent event = DocumentSelected(documentSelected: DocumentModel.empty);
          mockDocumentInfosBloc.add(event);

          /// Assert
          expect(event.props, equals([DocumentModel.empty]));
        });

        blocTest<DocumentInfosBloc, DocumentInfosState>(
          'Then it should give [DocumentInfosIsSelected] state.',
          build: DocumentInfosBloc.new,

          /// Act
          act: (DocumentInfosBloc bloc) => bloc.add(const DocumentSelected(documentSelected: DocumentModel.empty)),

          /// Assert
          expect: () => <DocumentInfosState>[
            const DocumentInfosIsSelected(documentSelected: DocumentModel.empty),
          ],
        );
      });

      group('When event [DocumentInfosStarted] is detected.', () {
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          final DocumentInfosEvent event = DocumentInfosStarted();
          mockDocumentInfosBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<DocumentInfosBloc, DocumentInfosState>(
          'Then it should give [DocumentInfosOn] state.',
          build: DocumentInfosBloc.new,

          /// Act
          act: (DocumentInfosBloc bloc) => bloc.add(DocumentInfosStarted()),

          /// Assert
          expect: () => <DocumentInfosState>[
            DocumentInfosOn(),
          ],
        );
      });

      group('When event [DocumentInfosStopped] is detected.', () {
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          final DocumentInfosEvent event = DocumentInfosStopped();
          mockDocumentInfosBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });
        blocTest<DocumentInfosBloc, DocumentInfosState>(
          'Then it should give [DocumentInfosOff] state.',
          build: DocumentInfosBloc.new,

          /// Act
          act: (DocumentInfosBloc bloc) => bloc.add(DocumentInfosStopped()),

          /// Assert
          expect: () => <DocumentInfosState>[
            DocumentInfosOff(),
          ],
        );
      });

      group('When event [DocumentInfosEditableActivated] is detected.', () {
        test('Then event should have one document to edit.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          const DocumentInfosEvent event = DocumentInfosEditableActivated(documentToEdit: DocumentModel.empty);
          mockDocumentInfosBloc.add(event);

          /// Assert
          expect(event.props, equals([DocumentModel.empty]));
        });
        blocTest<DocumentInfosBloc, DocumentInfosState>(
          'Then it should give [DocumentInfosIsEditable] state.',
          build: DocumentInfosBloc.new,

          /// Act
          act: (DocumentInfosBloc bloc) => bloc.add(const DocumentInfosEditableActivated(documentToEdit: DocumentModel.empty)),

          /// Assert
          expect: () => <DocumentInfosState>[
            const DocumentInfosIsEditable(documentToEdit: DocumentModel.empty),
          ],
        );
      });

      group('When event [DocumentInfosEditableCancelled] is detected.', () {
        test('Then event should have one document to cancel the edition.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          const DocumentInfosEvent event = DocumentInfosEditableCancelled(documentUpdated: DocumentModel.empty);
          mockDocumentInfosBloc.add(event);

          /// Assert
          expect(event.props, equals([DocumentModel.empty]));
        });

        blocTest<DocumentInfosBloc, DocumentInfosState>(
          'Then it should give [DocumentInfosIsEditable] state.',
          build: DocumentInfosBloc.new,

          /// Act
          act: (DocumentInfosBloc bloc) => bloc.add(const DocumentInfosEditableCancelled(documentUpdated: DocumentModel.empty)),

          /// Assert
          expect: () => <DocumentInfosState>[
            const DocumentInfosIsNotEditable(documentUpdated: DocumentModel.empty),
          ],
        );
      });

      group('When event [DocumentInfosFormIsSubmitted] is detected.', () {
        setUp(() {
          mockDocumentInfosBloc = MockDocumentInfosBloc();
          oneDocumentUpsertDTO = OneDocumentUpsertDTO.fromJson(<String, dynamic>{
            'size': 2343,
            'mimetype': 'image/png',
            'filename': 'image.png',
            'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
            'folder': 'images',
            'path': 'images/image.png',
          });

          upsertParams = UpsertParams(
            accessToken: fakeAuthToken.accessToken,
            endPoint: MainProject.documentsEndPoint,
            body: jsonEncode(oneDocumentUpsertDTO.toJson()),
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
                  oneDocumentUpsertDTO.toJson(),
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: oneDocumentUpsertDTO.toJson(),
                  ),
                ),
              ),
            ),
          );
        });
        test('Then props should have oneDocumentUpsertDTO.', () {
          /// Arrange
          whenListen(
            mockDocumentInfosBloc,
            Stream.fromIterable([]),
            initialState: DocumentInfosInitial(),
          );

          /// Act
          final DocumentInfosEvent event = DocumentInfosFormIsSubmitted(oneDocumentUpsertDTO: oneDocumentUpsertDTO);
          mockDocumentInfosBloc.add(event);

          /// Assert
          expect(event.props, equals([oneDocumentUpsertDTO]));
        });

        blocTest<DocumentInfosBloc, DocumentInfosState>(
          'Then it should give [DocumentInfosFormIsSubmittedSuccessfully] state.',
          build: DocumentInfosBloc.new,

          /// Act
          act: (DocumentInfosBloc bloc) => bloc.add(DocumentInfosFormIsSubmitted(oneDocumentUpsertDTO: oneDocumentUpsertDTO)),

          /// Assert
          expect: () => <DocumentInfosState>[
            DocumentInfosFormIsSubmittedSuccessfully(
              documentUpdated: DocumentModel.fromJson(oneDocumentUpsertDTO.toJson()),
            ),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      /// GRID API
      group('When event any requests is detected.', () {
        testAPIFailures(mockAbstractServerNestjsRepository);
      });
    });
  });
}

void testAPIFailures(
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
    NothingWorkDoingFailure(),
    IDontKnowWhatImDoingFailure(),
    UnExpectedFailure(),
  ]);

  final List<DocumentInfosEvent> eventsWithUpsertParams = List<DocumentInfosEvent>.of([
    DocumentInfosFormIsSubmitted(
      oneDocumentUpsertDTO: OneDocumentUpsertDTO.fromJson(<String, dynamic>{
        'size': 2343,
        'mimetype': 'image/png',
        'filename': 'image.png',
        'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
        'folder': 'images',
        'path': 'images/image.png',
      }),
    ),
  ]);

  for (final DocumentInfosEvent event in eventsWithUpsertParams) {
    for (final Failure failure in failures) {
      blocTest<DocumentInfosBloc, DocumentInfosState>(
        'Then it should give [DocumentInfosHaveFailures] state for $failure.',
        build: DocumentInfosBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.upsertOne(
              UpsertParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.documentsEndPoint,
                body: jsonEncode(
                  OneDocumentUpsertDTO.fromJson(
                    <String, dynamic>{
                      'size': 2343,
                      'mimetype': 'image/png',
                      'filename': 'image.png',
                      'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
                      'folder': 'images',
                      'path': 'images/image.png',
                    },
                  ).toJson(),
                ),
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (DocumentInfosBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <DocumentInfosState>[DocumentInfosIsLoading()]
            : <DocumentInfosState>[
                DocumentInfosHaveFailures(message: failure.message),
              ],
      );
    }
  }
}

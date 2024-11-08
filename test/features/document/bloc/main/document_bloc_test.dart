import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observer_core/constantes.dart';
import 'package:observer_core/enums/enums_export.dart';
import 'package:observer_core/features/features_export.dart';
import 'package:observer_core/models/models_export.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../server_nestjs/data/fake_datas.dart';
import 'document_bloc_test.mocks.dart';

class MockDocumentBloc extends MockBloc<DocumentEvent, DocumentState> implements DocumentBloc {}

class MockFormData extends Mock implements FormData {}

class UnExpectedFailure extends Failure {}

@GenerateMocks([
  AbstractServerNestjsRepository,
  AbstractInMemoryApiNestjsRepository,
  AbstractAuthTokenSource,
])
void main() {
  late GetParams getParams;
  late DeleteParams deleteParams;
  late UploadFormDataParams uploadFormDataParams;
  late DocumentModel fakeDocumentModel;
  late DocumentResponse fakeDocumentResponse;
  late MockDocumentBloc mockDocumentBloc;
  late MockAbstractAuthTokenSource mockAbstractAuthTokenSource;
  late MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository;
  late MockAbstractInMemoryApiNestjsRepository mockAbstractInMemoryApiNestjsRepository;
  late AuthTokenModel authTokenModel;
  late FormData formData;
  late List<int> idsToDelete;
  late String bodyToDelete;
  late String errorMessage;

  fakeDocumentModel = DocumentModel.fromJson(
    <String, dynamic>{
      'size': 2343,
      'mimetype': 'image/png',
      'filename': 'image.png',
      'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
      'folder': 'images',
      'path': 'images/image.png',
    },
  );
  fakeDocumentResponse = DocumentResponse.fromJson(
    <String, dynamic>{
      'total': 1,
      'results': [
        <String, dynamic>{
          'size': 2343,
          'mimetype': 'image/png',
          'filename': 'image.png',
          'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
          'folder': 'images',
          'path': 'images/image.png',
        },
      ],
    },
  );

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

  group('Scenario of DocumentBloc', () {
    group('Given the fact the bloc is started.', () {
      group('When there is no event state.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });
        test('Then it should return [DocumentInitial] state.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          // no act

          /// Assert
          expect(mockDocumentBloc.state, equals(DocumentInitial()));
        });
      });
    });
    group('Given the fact the bloc is on reconnection.', () {
      group('When event [DocumentsOnReconnect] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsOnReconnect();
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should return [DocumentInitial] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsOnReconnect()),

          /// Assert
          expect: () => <DocumentState>[
            DocumentInitial(),
          ],
        );
      });
    });
    group('Given the fact the bloc is on reconnection.', () {
      group('When event [DocumentsFormReset] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });

        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsFormReset();
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should return [DocumentInitial] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsFormReset()),

          /// Assert
          expect: () => <DocumentState>[
            DocumentInitial(),
          ],
        );
      });
    });

    /// LOADED
    group('Given the fact the documents are loaded successfully.', () {
      /// GRID
      group('When event [DocumentsInGridAreCalled] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.documentsEndPoint,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  <String, dynamic>{
                    ...fakeDocumentResponse.toJson(),
                    'results': fakeDocumentResponse.results
                        .map(
                          (DocumentModel document) => document.toJson(),
                        )
                        .toList(),
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      ...fakeDocumentResponse.toJson(),
                      'results': fakeDocumentResponse.results.map((response) => response.toJson()).toList(),
                    },
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have documents responses.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsInGridAreCalled(documentResponse: fakeDocumentResponse);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeDocumentResponse]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentsAreLoading] and [DocumentsAreLoadedSuccessfully] states.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsInGridAreCalled(documentResponse: fakeDocumentResponse)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentsAreLoading(),
            DocumentsAreLoadedSuccessfully(documentResponse: fakeDocumentResponse),
          ],
        );
      });

      /// LIST
      group('When event [DocumentsInListAreCalled] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.documentsEndPoint,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  <String, dynamic>{
                    ...fakeDocumentResponse.toJson(),
                    'results': fakeDocumentResponse.results
                        .map(
                          (DocumentModel document) => document.toJson(),
                        )
                        .toList(),
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      ...fakeDocumentResponse.toJson(),
                      'results': fakeDocumentResponse.results.map((response) => response.toJson()).toList(),
                    },
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have documents responses.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsInListAreCalled(documentResponse: fakeDocumentResponse);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([fakeDocumentResponse]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentsAreLoading] and [DocumentsAreLoadedSuccessfully] states.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsInListAreCalled(documentResponse: fakeDocumentResponse)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentsAreLoading(),
            DocumentsAreLoadedSuccessfully(documentResponse: fakeDocumentResponse),
          ],
        );
      });

      /// FILTER
      group('When event [DocumentsFilteredAreCalled] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.documentsEndPoint,
            filteredBy: DocumentFilteredType.images,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  <String, dynamic>{
                    ...fakeDocumentResponse.toJson(),
                    'results': fakeDocumentResponse.results
                        .map(
                          (DocumentModel document) => document.toJson(),
                        )
                        .toList(),
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      ...fakeDocumentResponse.toJson(),
                      'results': fakeDocumentResponse.results.map((response) => response.toJson()).toList(),
                    },
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a filter.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          const DocumentEvent event = DocumentsFilteredAreCalled(filteredBy: DocumentFilteredType.images);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([DocumentFilteredType.images]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentsAreLoading] and [DocumentsAreLoadedSuccessfully] states.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(const DocumentsFilteredAreCalled(filteredBy: DocumentFilteredType.images)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentsAreLoading(),
            DocumentsAreLoadedSuccessfully(documentResponse: fakeDocumentResponse),
          ],
        );
      });

      /// RELOAD
      group('When event [DocumentsReloaded] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();

          getParams = GetParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.documentsEndPoint,
          );
          when(
            mockAbstractServerNestjsRepository.getResponses(
              getParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  <String, dynamic>{
                    ...fakeDocumentResponse.toJson(),
                    'results': fakeDocumentResponse.results
                        .map(
                          (DocumentModel document) => document.toJson(),
                        )
                        .toList(),
                  },
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: <String, dynamic>{
                      ...fakeDocumentResponse.toJson(),
                      'results': fakeDocumentResponse.results.map((response) => response.toJson()).toList(),
                    },
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a filter.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          const DocumentEvent event = DocumentsReloaded();
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([DocumentFilteredType.images]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentsAreLoading] and [DocumentsAreLoadedSuccessfully] states.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(const DocumentsReloaded()),

          /// Assert
          expect: () => <DocumentState>[
            DocumentsAreLoading(),
            DocumentsAreLoadedSuccessfully(documentResponse: fakeDocumentResponse),
          ],
        );
      });
    });

    /// UPSERT
    group('Given the fact the documents are submitted successfully.', () {
      group('When event [DocumentActionCreateCalled] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentActionCreateCalled();
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentToCreateForm] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentActionCreateCalled()),

          /// Assert
          expect: () => <DocumentState>[
            const DocumentToCreateForm(),
          ],
        );
      });

      group('When event [DocumentActionUpdateCalled] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });
        test('Then event should have no props.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentActionUpdateCalled();
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentToUpdateForm] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentActionUpdateCalled()),

          /// Assert
          expect: () => <DocumentState>[
            const DocumentToUpdateForm(),
          ],
        );
      });

      group('When event [DocumentsInProgress] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });
        test('Then the props should have an UpsertFormType.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          const DocumentEvent event = DocumentsInProgress(formProcess: UpsertFormType.create);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([UpsertFormType.create]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentsFormIsProcessing] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(const DocumentsInProgress(formProcess: UpsertFormType.create)),

          /// Assert
          expect: () => <DocumentState>[
            const DocumentsFormIsProcessing(formProcess: UpsertFormType.create),
          ],
        );
      });

      group('When event [MultipleDocumentsToUpload] is detected for a list.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
          formData = FormData();
          uploadFormDataParams = UploadFormDataParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.documentsMultiUploadEndPoint,
            formData: formData,
          );

          when(
            mockAbstractServerNestjsRepository.uploadFormData(
              uploadFormDataParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  [
                    {
                      'size': 2343,
                      'mimetype': 'image/png',
                      'filename': 'image.png',
                      'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
                      'folder': 'images',
                      'path': 'images/image.png',
                    } as dynamic,
                  ],
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: [
                      {
                        'size': 2343,
                        'mimetype': 'image/png',
                        'filename': 'image.png',
                        'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
                        'folder': 'images',
                        'path': 'images/image.png',
                      } as dynamic,
                    ],
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a form data.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = MultipleDocumentsToUpload(formData: formData);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([formData]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentFormIsSubmittedSuccessfully] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(MultipleDocumentsToUpload(formData: formData)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentFormIsSubmittedSuccessfully(documents: [fakeDocumentModel]),
          ],
        );
      });

      group('When event [MultipleDocumentsToUpload] is detected for an object.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
          formData = FormData();
          uploadFormDataParams = UploadFormDataParams(
            accessToken: authTokenModel.accessToken,
            endPoint: MainProject.documentsMultiUploadEndPoint,
            formData: formData,
          );

          when(
            mockAbstractServerNestjsRepository.uploadFormData(
              uploadFormDataParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  {
                    'size': 2343,
                    'mimetype': 'image/png',
                    'filename': 'image.png',
                    'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
                    'folder': 'images',
                    'path': 'images/image.png',
                  } as dynamic,
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 201,
                    data: {
                      'size': 2343,
                      'mimetype': 'image/png',
                      'filename': 'image.png',
                      'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
                      'folder': 'images',
                      'path': 'images/image.png',
                    } as dynamic,
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a form data.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = MultipleDocumentsToUpload(formData: formData);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([formData]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentFormIsSubmittedSuccessfully] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(MultipleDocumentsToUpload(formData: formData)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentFormIsSubmittedSuccessfully(documents: [fakeDocumentModel]),
          ],
        );
      });
    });

    /// DELETED
    group('Given the fact the documents are deleted successfully.', () {
      group('When event [DocumentsDeleted] is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();

          /// ICI
          idsToDelete = [1];
          bodyToDelete = jsonEncode(
            {
              'documentsIds': idsToDelete,
            },
          );
          deleteParams = DeleteParams(
            endPoint: MainProject.documentsMultiDeleteEndPoint,
            accessToken: fakeAuthToken.accessToken,
            body: bodyToDelete,
          );

          when(
            mockAbstractServerNestjsRepository.deleteOne(
              deleteParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Right(
                HttpResponse(
                  bodyToDelete,
                  Response(
                    requestOptions: RequestOptions(),
                    statusCode: 200,
                    data: bodyToDelete,
                  ),
                ),
              ),
            ),
          );
        });

        test('Then the props should have a list of ids.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsDeleted(documentIdsForDelete: idsToDelete);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([idsToDelete]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentFormIsDeletedSuccessfully] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsDeleted(documentIdsForDelete: idsToDelete)),

          /// Assert
          expect: () => <DocumentState>[
            const DocumentFormIsDeletedSuccessfully(),
          ],
        );
      });
    });

    /// HAVE ERRORS
    group('Given the fact requests returns errors.', () {
      group('When event any requests is detected.', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
        });
        testAPIFailures(mockAbstractServerNestjsRepository);
        testFailureUpload(mockAbstractServerNestjsRepository);
        testFailureDelete(mockAbstractServerNestjsRepository);
      });

      group('When event [DocumentsFailed] is detected .', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
          errorMessage = 'error';
        });

        test('Then the props should have an error message.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsFailed(message: errorMessage);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([errorMessage]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentFormIsDeletedSuccessfully] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsFailed(message: errorMessage)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentsHaveFailures(message: errorMessage),
          ],
        );
      });

      group('When event [DocumentsErrorPageShown] is detected .', () {
        setUp(() {
          mockDocumentBloc = MockDocumentBloc();
          errorMessage = 'error';
        });

        test('Then the props should have an error message.', () {
          /// Arrange
          whenListen(
            mockDocumentBloc,
            Stream.fromIterable([]),
            initialState: DocumentInitial(),
          );

          /// Act
          final DocumentEvent event = DocumentsErrorPageShown(message: errorMessage);
          mockDocumentBloc.add(event);

          /// Assert
          expect(event.props, equals([errorMessage]));
        });

        blocTest<DocumentBloc, DocumentState>(
          'Then it should give a [DocumentFormIsDeletedSuccessfully] state.',
          build: DocumentBloc.new,

          /// Act
          act: (DocumentBloc bloc) => bloc.add(DocumentsErrorPageShown(message: errorMessage)),

          /// Assert
          expect: () => <DocumentState>[
            DocumentsHaveFailures(message: errorMessage),
          ],
        );
      });
    });
  });
}

void testAPIFailures(
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
) {
  final fakeDocumentResponse = DocumentResponse.fromJson(
    <String, dynamic>{
      'total': 1,
      'results': [
        <String, dynamic>{
          'size': 2343,
          'mimetype': 'image/png',
          'filename': 'image.png',
          'description': 'Utile pour l‘attribut ‘alt‘ lors de la construction du front',
          'folder': 'images',
          'path': 'images/image.png',
        },
      ],
    },
  );
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

  final List<DocumentEvent> eventsWithGetParams = List<DocumentEvent>.of([
    DocumentsInGridAreCalled(documentResponse: fakeDocumentResponse),
    DocumentsInListAreCalled(documentResponse: fakeDocumentResponse),
    const DocumentsFilteredAreCalled(filteredBy: DocumentFilteredType.images),
    const DocumentsReloaded(),
  ]);

  for (final DocumentEvent event in eventsWithGetParams) {
    for (final Failure failure in failures) {
      blocTest<DocumentBloc, DocumentState>(
        'Then it should give [DocumentsHaveFailures] state for $failure.',
        build: DocumentBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.getResponses(
              GetParams(
                accessToken: fakeAuthToken.accessToken,
                endPoint: MainProject.documentsEndPoint,
              ),
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (DocumentBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <DocumentState>[DocumentsAreLoading()]
            : <DocumentState>[
                DocumentsAreLoading(),
                DocumentsHaveFailures(message: failure.message),
              ],
      );
    }
  }
}

void testFailureUpload(
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
) {
  final FormData formData = FormData();
  final UploadFormDataParams uploadFormDataParams = UploadFormDataParams(
    accessToken: fakeAuthToken.accessToken,
    endPoint: MainProject.documentsMultiUploadEndPoint,
    formData: formData,
  );

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

  final List<DocumentEvent> eventsWithUploadParams = List<DocumentEvent>.of([
    MultipleDocumentsToUpload(formData: formData),
  ]);
  for (final DocumentEvent event in eventsWithUploadParams) {
    for (final Failure failure in failures) {
      blocTest<DocumentBloc, DocumentState>(
        'Then it should give [DocumentsHaveFailures] state for $failure.',
        build: DocumentBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.uploadFormData(
              uploadFormDataParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (DocumentBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <DocumentState>[DocumentsAreLoading()]
            : <DocumentState>[
                DocumentsHaveFailures(message: failure.message),
              ],
      );
    }
  }
}

void testFailureDelete(
  MockAbstractServerNestjsRepository mockAbstractServerNestjsRepository,
) {
  final String body = jsonEncode(
    {
      'documentsIds': [1],
    },
  );
  final DeleteParams deleteParams = DeleteParams(
    endPoint: MainProject.documentsMultiDeleteEndPoint,
    accessToken: fakeAuthToken.accessToken,
    body: body,
  );

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

  final List<int> ids = [1];
  final List<DocumentEvent> eventsWithDeleteParams = List<DocumentEvent>.of([
    DocumentsDeleted(documentIdsForDelete: ids),
  ]);

  for (final DocumentEvent event in eventsWithDeleteParams) {
    for (final Failure failure in failures) {
      blocTest<DocumentBloc, DocumentState>(
        'Then it should give [DocumentsHaveFailures] state for $failure.',
        build: DocumentBloc.new,

        /// Arrange
        setUp: () {
          when(
            mockAbstractServerNestjsRepository.deleteOne(
              deleteParams,
            ),
          ).thenAnswer(
            (_) => Future<Either<Failure, HttpResponse<dynamic>>>.value(
              Left(failure),
            ),
          );
        },

        /// Act
        act: (DocumentBloc bloc) => bloc.add(event),

        /// Assert
        expect: () => failure == UnExpectedFailure()
            ? <DocumentState>[DocumentsAreLoading()]
            : <DocumentState>[
                DocumentsHaveFailures(message: failure.message),
              ],
      );
    }
  }
}

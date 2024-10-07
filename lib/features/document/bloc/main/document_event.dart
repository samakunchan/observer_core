part of 'document_bloc.dart';

/// Tout les events :
/// - DocumentsAreCalled
/// - DocumentsFilteredAreCalled
/// - DocumentIsCalled
/// - DocumentActionCreateCalled
/// - DocumentActionUpdateCalled
/// - OneDocumentToUpload
/// - MultipleDocumentsToUpload
/// - DocumentsFormReset
/// - DocumentsInProgress
/// - DocumentsDeleted
/// - DocumentsReloaded
abstract class DocumentEvent extends Equatable {
  const DocumentEvent();
}

class DocumentsInGridAreCalled extends DocumentEvent {
  const DocumentsInGridAreCalled({
    this.isFetchingApi = true,
    this.documentResponse = DocumentResponse.empty,
  });

  final DocumentResponse documentResponse;
  final bool isFetchingApi;

  @override
  List<Object?> get props => [isFetchingApi, documentResponse];
}

class DocumentsInListAreCalled extends DocumentEvent {
  const DocumentsInListAreCalled({
    this.isFetchingApi = true,
    this.documentResponse = DocumentResponse.empty,
  });

  final DocumentResponse documentResponse;
  final bool isFetchingApi;
  @override
  List<Object?> get props => [documentResponse, isFetchingApi];
}

class DocumentsFilteredAreCalled extends DocumentEvent {
  const DocumentsFilteredAreCalled({required this.filteredBy});

  final DocumentFilteredType filteredBy;

  @override
  List<Object?> get props => [filteredBy];
}

class DocumentIsCalled extends DocumentEvent {
  const DocumentIsCalled({required this.url});

  final String url;
  @override
  List<Object?> get props => [url];
}

class DocumentActionCreateCalled extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

class DocumentActionUpdateCalled extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

class OneDocumentToUpload extends DocumentEvent {
  const OneDocumentToUpload({required this.formData});
  final FormData formData;

  @override
  List<Object?> get props => [formData];
}

class MultipleDocumentsToUpload extends DocumentEvent {
  const MultipleDocumentsToUpload({required this.formData});
  final FormData formData;

  @override
  List<Object?> get props => [formData];
}

class DocumentsFormReset extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

class DocumentsInProgress extends DocumentEvent {
  const DocumentsInProgress({required this.formProcess});

  final UpsertFormType formProcess;

  @override
  List<Object?> get props => [formProcess];
}

class DocumentDeleted extends DocumentEvent {
  const DocumentDeleted({required this.documentForDelete});

  final DocumentModel documentForDelete;

  @override
  List<Object?> get props => [documentForDelete];
}

class DocumentsDeleted extends DocumentEvent {
  const DocumentsDeleted({required this.documentIdsForDelete});

  final List<int> documentIdsForDelete;

  @override
  List<Object?> get props => [documentIdsForDelete];
}

class DocumentsReloaded extends DocumentEvent {
  const DocumentsReloaded({this.filteredBy = DocumentFilteredType.images});

  final DocumentFilteredType filteredBy;
  @override
  List<Object?> get props => [filteredBy];
}

class DocumentsFailed extends DocumentEvent {
  const DocumentsFailed({required this.message});

  final String message;
  @override
  List<Object?> get props => [message];
}

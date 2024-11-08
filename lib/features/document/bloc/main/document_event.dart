part of 'document_bloc.dart';

/// Tout les events :
/// - DocumentsAreCalled
/// - DocumentsFilteredAreCalled
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
    this.documentResponse = DocumentResponse.empty,
  });

  final DocumentResponse documentResponse;

  @override
  List<Object?> get props => [documentResponse];
}

class DocumentsInListAreCalled extends DocumentEvent {
  const DocumentsInListAreCalled({
    this.documentResponse = DocumentResponse.empty,
  });

  final DocumentResponse documentResponse;
  @override
  List<Object?> get props => [documentResponse];
}

class DocumentsFilteredAreCalled extends DocumentEvent {
  const DocumentsFilteredAreCalled({required this.filteredBy});

  final DocumentFilteredType filteredBy;

  @override
  List<Object?> get props => [filteredBy];
}

class DocumentActionCreateCalled extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

class DocumentActionUpdateCalled extends DocumentEvent {
  @override
  List<Object?> get props => [];
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

class DocumentsErrorPageShown extends DocumentEvent {
  const DocumentsErrorPageShown({this.message = ErrorMessage.noErrorMessageHandled});

  /// Tout les messages d'érreurs:
  /// - [ErrorMessage.noErrorMessageHandled]
  /// - [ErrorMessage.networkOfflineMessage]
  /// - [ErrorMessage.serverFailureMessage]
  /// - [ErrorMessage.cacheFailureMessage]
  /// - [ErrorMessage.notFoundMessage]
  /// - [ErrorMessage.unAuthorizationMessage]
  /// - [ErrorMessage.forbiddenMessage]
  final String message;

  @override
  List<Object> get props => [message];
}

class DocumentsOnReconnect extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

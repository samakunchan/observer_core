part of 'document_bloc.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();
}

class DocumentsAreCalled extends DocumentEvent {
  const DocumentsAreCalled();
  @override
  List<Object?> get props => [];
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

class DocumentsDeleted extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

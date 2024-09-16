part of 'document_bloc.dart';

sealed class DocumentEvent extends Equatable {
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
  @override
  List<Object?> get props => [];
}

class DocumentsDeleted extends DocumentEvent {
  @override
  List<Object?> get props => [];
}

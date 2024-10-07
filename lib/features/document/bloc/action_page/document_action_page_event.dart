part of 'document_action_page_bloc.dart';

sealed class DocumentActionPageEvent extends Equatable {
  const DocumentActionPageEvent();
}

class DocumentPageEditableActivated extends DocumentActionPageEvent {
  List<Object?> get props => [];
}

class DocumentPageEditableCancelled extends DocumentActionPageEvent {
  @override
  List<Object?> get props => [];
}

class DocumentPageItemSelected extends DocumentActionPageEvent {
  const DocumentPageItemSelected({required this.document});

  final DocumentModel document;

  @override
  List<Object?> get props => [document];
}

class DocumentPageItemUnSelected extends DocumentActionPageEvent {
  const DocumentPageItemUnSelected({required this.document});

  final DocumentModel document;

  @override
  List<Object?> get props => [document];
}

class DocumentPageResultsUpdated extends DocumentActionPageEvent {
  const DocumentPageResultsUpdated({required this.results});

  final List<int> results;

  @override
  List<Object?> get props => [results];
}

class DocumentPageAllSelected extends DocumentActionPageEvent {
  @override
  List<Object?> get props => [];
}

class DocumentPageAllCanceled extends DocumentActionPageEvent {
  @override
  List<Object?> get props => [];
}

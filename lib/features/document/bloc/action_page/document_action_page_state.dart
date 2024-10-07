part of 'document_action_page_bloc.dart';

abstract class DocumentActionPageState extends Equatable {
  const DocumentActionPageState();
}

final class DocumentActionPageInitial extends DocumentActionPageState {
  @override
  List<Object> get props => [];
}

class DocumentPageIsEditable extends DocumentActionPageState {
  @override
  List<Object?> get props => [];
}

class DocumentPageIsNotEditable extends DocumentActionPageState {
  @override
  List<Object?> get props => [];
}

class DocumentPageItemIsChecked extends DocumentActionPageState {
  const DocumentPageItemIsChecked({required this.document});

  final DocumentModel document;

  @override
  List<Object?> get props => [document];
}

class DocumentPageItemIsUnChecked extends DocumentActionPageState {
  const DocumentPageItemIsUnChecked({required this.document});

  final DocumentModel document;

  @override
  List<Object?> get props => [document];
}

class DocumentPageListSelected extends DocumentActionPageState {
  const DocumentPageListSelected({this.results = const []});

  final List<int> results;

  @override
  List<Object?> get props => [results];
}

class DocumentPageAllItemsAreSelected extends DocumentActionPageState {
  @override
  List<Object?> get props => [];
}

class DocumentPageAllItemsAreUnSelected extends DocumentActionPageState {
  @override
  List<Object?> get props => [];
}

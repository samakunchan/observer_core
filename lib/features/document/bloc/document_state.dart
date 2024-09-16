part of 'document_bloc.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();
}

final class DocumentInitial extends DocumentState {
  @override
  List<Object> get props => [];
}

final class DocumentsAreLoading extends DocumentState {
  @override
  List<Object> get props => [];
}

final class DocumentsFormIsProcessing extends DocumentState {
  @override
  List<Object> get props => [];
}

final class DocumentsHaveFailures extends DocumentState {
  const DocumentsHaveFailures({this.message = ErrorMessage.noErrorMessageHandled});

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

final class DocumentFormIsSubmittedSuccessfully extends DocumentState {
  const DocumentFormIsSubmittedSuccessfully({required this.documents});

  final List<DocumentModel> documents;

  @override
  List<Object> get props => [];
}

class DocumentFormIsDeletedSuccessfully extends DocumentState {
  const DocumentFormIsDeletedSuccessfully();
  @override
  List<Object> get props => [];
}

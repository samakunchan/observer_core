part of 'document_bloc.dart';

/// # Tout les states actuellement
/// - DocumentInitial
/// - DocumentsAreLoading
/// - DocumentToCreateForm
/// - DocumentToUpdateForm
/// - DocumentsFormIsProcessing
/// - DocumentsHaveFailures
/// - DocumentFormIsSubmittedSuccessfully
/// - DocumentFormIsDeletedSuccessfully
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

final class DocumentsAreLoadedSuccessfully extends DocumentState {
  const DocumentsAreLoadedSuccessfully({required this.documentResponse, this.screenMode = ScreenMode.grid});

  final DocumentResponse documentResponse;
  final ScreenMode screenMode;

  @override
  List<Object> get props => [documentResponse];
}

final class DocumentToCreateForm extends DocumentState {
  const DocumentToCreateForm({this.isProcessing = false});

  final bool isProcessing;
  @override
  List<Object> get props => [isProcessing];
}

final class DocumentToUpdateForm extends DocumentState {
  const DocumentToUpdateForm({this.isProcessing = false});

  final bool isProcessing;
  @override
  List<Object> get props => [isProcessing];
}

final class DocumentsFormIsProcessing extends DocumentState {
  const DocumentsFormIsProcessing({required this.formProcess});

  final UpsertFormType formProcess;

  @override
  List<Object> get props => [formProcess];
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

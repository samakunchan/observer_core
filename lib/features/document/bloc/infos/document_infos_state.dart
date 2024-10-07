part of 'document_infos_bloc.dart';

/// Tout les states :
/// - DocumentInfosInitial
/// - DocumentInfosOn
/// - DocumentInfosOff
/// - DocumentInfosIsSelected
/// - DocumentInfosIsEditable
/// - DocumentInfosIsNotEditable
abstract class DocumentInfosState extends Equatable {
  const DocumentInfosState();
}

final class DocumentInfosInitial extends DocumentInfosState {
  @override
  List<Object> get props => [];
}

final class DocumentInfosIsLoading extends DocumentInfosState {
  @override
  List<Object> get props => [];
}

final class DocumentInfosOn extends DocumentInfosState {
  @override
  List<Object> get props => [];
}

final class DocumentInfosOff extends DocumentInfosState {
  @override
  List<Object> get props => [];
}

class DocumentInfosIsSelected extends DocumentInfosState {
  const DocumentInfosIsSelected({
    required this.documentSelected,
  });

  final DocumentModel documentSelected;

  @override
  List<Object> get props => [documentSelected];
}

class DocumentInfosIsEditable extends DocumentInfosState {
  const DocumentInfosIsEditable({
    required this.documentToEdit,
  });

  final DocumentModel documentToEdit;

  @override
  List<Object> get props => [documentToEdit];
}

class DocumentInfosIsNotEditable extends DocumentInfosState {
  const DocumentInfosIsNotEditable({
    required this.documentUpdated,
  });

  final DocumentModel documentUpdated;
  @override
  List<Object> get props => [documentUpdated];
}

class DocumentInfosFormIsSubmittedSuccessfully extends DocumentInfosState {
  const DocumentInfosFormIsSubmittedSuccessfully({
    required this.documentUpdated,
  });

  final DocumentModel documentUpdated;
  @override
  List<Object> get props => [documentUpdated];
}

final class DocumentInfosHaveFailures extends DocumentInfosState {
  const DocumentInfosHaveFailures({this.message = ErrorMessage.noErrorMessageHandled});

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

part of 'document_infos_bloc.dart';

/// Tout les events :
/// - DocumentInfosStarted
/// - DocumentInfosStoped
/// - DocumentSelected
/// - DocumentInfosEditableActived
/// - DocumentInfosEditableCanceled
abstract class DocumentInfosEvent extends Equatable {
  const DocumentInfosEvent();
}

class DocumentInfosStarted extends DocumentInfosEvent {
  @override
  List<Object?> get props => [];
}

class DocumentInfosStoped extends DocumentInfosEvent {
  @override
  List<Object?> get props => [];
}

class DocumentSelected extends DocumentInfosEvent {
  const DocumentSelected({
    required this.documentSelected,
  });

  final DocumentModel documentSelected;

  @override
  List<Object?> get props => [documentSelected];
}

class DocumentInfosEditableActived extends DocumentInfosEvent {
  const DocumentInfosEditableActived({
    required this.documentToEdit,
  });

  final DocumentModel documentToEdit;

  @override
  List<Object?> get props => [documentToEdit];
}

class DocumentInfosEditableCanceled extends DocumentInfosEvent {
  const DocumentInfosEditableCanceled({
    required this.documentUpdated,
  });

  final DocumentModel documentUpdated;

  @override
  List<Object?> get props => [documentUpdated];
}

class DocumentInfosFormIsSubmitted extends DocumentInfosEvent {
  const DocumentInfosFormIsSubmitted({
    required this.oneDocumentUpsertDTO,
  });

  final OneDocumentUpsertDTO oneDocumentUpsertDTO;

  @override
  List<Object?> get props => [oneDocumentUpsertDTO];
}

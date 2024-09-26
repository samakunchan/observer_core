part of 'document_infos_bloc.dart';

/// Tout les events :
/// - DocumentSelected
abstract class DocumentInfosEvent extends Equatable {
  const DocumentInfosEvent();
}

class DocumentSelected extends DocumentInfosEvent {
  const DocumentSelected({
    required this.documentSelected,
  });

  final DocumentModel documentSelected;

  @override
  List<Object?> get props => [documentSelected];
}

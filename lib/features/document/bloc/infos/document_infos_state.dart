part of 'document_infos_bloc.dart';

/// Tout les states :
/// - DocumentInfosInitial
/// - DocumentInfosIsSelected
abstract class DocumentInfosState extends Equatable {
  const DocumentInfosState();
}

final class DocumentInfosInitial extends DocumentInfosState {
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

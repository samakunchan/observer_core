import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/document/feature_document_export.dart';
import 'package:observer_core/models/document/document_model.dart';

class DocumentSelectedSelector extends StatelessWidget {
  const DocumentSelectedSelector({required this.builder, super.key});
  final Widget Function(BuildContext, DocumentModel) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DocumentInfosBloc, DocumentInfosState, DocumentModel>(
      selector: whenOneDocumentIsSelected,
      builder: builder,
    );
  }

  static DocumentModel whenOneDocumentIsSelected(DocumentInfosState state) =>
      state is DocumentInfosIsSelected ? state.documentSelected : DocumentModel.empty;
}

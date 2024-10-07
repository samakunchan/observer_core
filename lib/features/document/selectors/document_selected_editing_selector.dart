import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/document/feature_document_export.dart';
import 'package:observer_core/models/document/document_model.dart';

class DocumentSelectedEditingSelector extends StatelessWidget {
  const DocumentSelectedEditingSelector({required this.builder, super.key});
  final Widget Function(BuildContext, DocumentModel) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DocumentInfosBloc, DocumentInfosState, DocumentModel>(
      selector: whenDocumentIsEditable,
      builder: builder,
    );
  }

  static DocumentModel whenDocumentIsEditable(DocumentInfosState state) =>
      state is DocumentInfosIsEditable ? state.documentToEdit : DocumentModel.empty;
}

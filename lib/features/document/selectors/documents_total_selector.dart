import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/document/bloc/main/document_bloc.dart';

class DocumentsTotalSelector extends StatelessWidget {
  const DocumentsTotalSelector({required this.builder, super.key});
  final Widget Function(BuildContext, int) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DocumentBloc, DocumentState, int>(
      selector: whenWeLoadCategoriesFromLocal,
      builder: builder,
    );
  }

  static int whenWeLoadCategoriesFromLocal(DocumentState state) =>
      state is DocumentsAreLoadedSuccessfully ? state.documentResponse.total : -1;
}

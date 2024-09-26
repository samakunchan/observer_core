import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/document/bloc/main/document_bloc.dart';

class DocumentsAreLoadedSelector extends StatelessWidget {
  const DocumentsAreLoadedSelector({required this.builder, super.key});
  final Widget Function(BuildContext, bool) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DocumentBloc, DocumentState, bool>(
      selector: whenWeLoadCategoriesFromLocal,
      builder: builder,
    );
  }

  static bool whenWeLoadCategoriesFromLocal(DocumentState state) => state is DocumentsAreLoadedSuccessfully;
}

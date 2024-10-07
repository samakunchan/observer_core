import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/features/document/bloc/action_page/document_action_page_bloc.dart';

class DocumentSelectedResultsSelector extends StatelessWidget {
  const DocumentSelectedResultsSelector({required this.builder, super.key});
  final Widget Function(BuildContext, List<int>?) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DocumentActionPageBloc, DocumentActionPageState, List<int>?>(
      selector: whenResultsListIsNotEmpty,
      builder: builder,
    );
  }

  static List<int>? whenResultsListIsNotEmpty(DocumentActionPageState state) {
    if (state is DocumentPageListSelected && state.results.isNotEmpty) {
      return state.results;
    }
    return null;
  }
}

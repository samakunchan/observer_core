import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:observer_core/models/document/document_model.dart';

part 'document_action_page_event.dart';
part 'document_action_page_state.dart';

class DocumentActionPageBloc extends Bloc<DocumentActionPageEvent, DocumentActionPageState> {
  DocumentActionPageBloc() : super(DocumentActionPageInitial()) {
    on<DocumentPageEditableActivated>(_activeEditableItem);
    on<DocumentPageEditableCancelled>(_cancelEditableItem);
    on<DocumentPageItemSelected>(_addItem);
    on<DocumentPageItemUnSelected>(_removeItem);
    on<DocumentPageResultsUpdated>(_updateResults);
    on<DocumentPageAllSelected>(_selectAll);
    on<DocumentPageAllCanceled>(_cancelAll);
  }

  Future<void> _activeEditableItem(DocumentPageEditableActivated event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageIsEditable());
  }

  Future<void> _cancelEditableItem(DocumentPageEditableCancelled event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageIsNotEditable());
  }

  Future<void> _addItem(DocumentPageItemSelected event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageItemIsChecked(document: event.document));
  }

  Future<void> _removeItem(DocumentPageItemUnSelected event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageItemIsUnChecked(document: event.document));
  }

  Future<void> _updateResults(DocumentPageResultsUpdated event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageListSelected(results: event.results));
  }

  Future<void> _selectAll(DocumentPageAllSelected event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageAllItemsAreSelected());
  }

  Future<void> _cancelAll(DocumentPageAllCanceled event, Emitter<DocumentActionPageState> emit) async {
    emit.call(DocumentPageAllItemsAreUnSelected());
  }
}

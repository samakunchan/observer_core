import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:observer_core/models/models_export.dart';

part 'document_infos_event.dart';
part 'document_infos_state.dart';

class DocumentInfosBloc extends Bloc<DocumentInfosEvent, DocumentInfosState> {
  DocumentInfosBloc() : super(DocumentInfosInitial()) {
    on<DocumentSelected>(_selectOneDocument);
  }

  Future<void> _selectOneDocument(DocumentSelected event, Emitter<DocumentInfosState> emit) async {
    emit.call(DocumentInfosIsSelected(documentSelected: event.documentSelected));
  }
}

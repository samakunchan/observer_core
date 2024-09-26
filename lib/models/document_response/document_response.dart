import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/document/document_model.dart';

part 'document_response.freezed.dart';
part 'document_response.g.dart';

@freezed
class DocumentResponse with _$DocumentResponse {
  const factory DocumentResponse({
    required int total,
    required List<DocumentModel> results,
  }) = _DocumentResponse;

  factory DocumentResponse.fromJson(Map<String, dynamic> json) => _$DocumentResponseFromJson(json);
}

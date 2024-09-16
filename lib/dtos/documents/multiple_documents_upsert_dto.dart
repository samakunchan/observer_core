import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/dtos/documents/one_document_upsert_dto_dto.dart';

part 'multiple_documents_upsert_dto.g.dart';

@JsonSerializable()
class MultipleDocumentsUpsertDto {
  const MultipleDocumentsUpsertDto({required this.documents});

  factory MultipleDocumentsUpsertDto.fromJson(Map<String, dynamic> json) => _$MultipleDocumentsUpsertDtoFromJson(json);

  final List<OneDocumentUpsertDto> documents;

  Map<String, dynamic> toJson() => _$MultipleDocumentsUpsertDtoToJson(this);
}

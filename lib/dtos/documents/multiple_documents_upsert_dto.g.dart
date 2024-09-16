// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_documents_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultipleDocumentsUpsertDto _$MultipleDocumentsUpsertDtoFromJson(
        Map<String, dynamic> json) =>
    MultipleDocumentsUpsertDto(
      documents: (json['documents'] as List<dynamic>)
          .map((e) => OneDocumentUpsertDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MultipleDocumentsUpsertDtoToJson(
        MultipleDocumentsUpsertDto instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };

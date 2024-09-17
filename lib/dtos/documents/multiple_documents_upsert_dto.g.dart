// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_documents_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MultipleDocumentsUpsertDTOImpl _$$MultipleDocumentsUpsertDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$MultipleDocumentsUpsertDTOImpl(
      documents: (json['documents'] as List<dynamic>)
          .map((e) => OneDocumentUpsertDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MultipleDocumentsUpsertDTOImplToJson(
        _$MultipleDocumentsUpsertDTOImpl instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };

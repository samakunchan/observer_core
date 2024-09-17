// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryUpsertDTOImpl _$$CategoryUpsertDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryUpsertDTOImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      environment: (json['environment'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CategoryUpsertDTOImplToJson(
        _$CategoryUpsertDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'environment': instance.environment,
      'id': instance.id,
    };

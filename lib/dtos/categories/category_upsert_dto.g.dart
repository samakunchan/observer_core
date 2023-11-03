// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryUpsertDto _$CategoryUpsertDtoFromJson(Map<String, dynamic> json) =>
    CategoryUpsertDto(
      title: json['title'] as String,
      content: json['content'] as String,
      environment: json['environment'] as int,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$CategoryUpsertDtoToJson(CategoryUpsertDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'environment': instance.environment,
    };

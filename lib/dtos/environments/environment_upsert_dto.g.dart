// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentUpsertDto _$EnvironmentUpsertDtoFromJson(
        Map<String, dynamic> json) =>
    EnvironmentUpsertDto(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EnvironmentUpsertDtoToJson(
        EnvironmentUpsertDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

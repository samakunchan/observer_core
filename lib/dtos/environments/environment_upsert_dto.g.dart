// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentUpsertDTOImpl _$$EnvironmentUpsertDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentUpsertDTOImpl(
      title: json['title'] as String,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryUpsertDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EnvironmentUpsertDTOImplToJson(
        _$EnvironmentUpsertDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'categories': instance.categories,
      'id': instance.id,
    };

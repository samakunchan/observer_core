// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_delete_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDeleteDTOImpl _$$CategoryDeleteDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryDeleteDTOImpl(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryDeleteDTOImplToJson(
        _$CategoryDeleteDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'categories': instance.categories,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvironmentModelImpl _$$EnvironmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentModelImpl(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EnvironmentModelImplToJson(
        _$EnvironmentModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'categories': instance.categories,
    };

_$EnvironmentAssociatedModelImpl _$$EnvironmentAssociatedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnvironmentAssociatedModelImpl(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EnvironmentAssociatedModelImplToJson(
        _$EnvironmentAssociatedModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
    };

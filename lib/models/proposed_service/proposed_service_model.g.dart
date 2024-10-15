// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposed_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProposedServiceModelImpl _$$ProposedServiceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProposedServiceModelImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      isPublished: json['isPublished'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      icon: json['icon'] as String?,
      deletedAt: json['deletedAt'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProposedServiceModelImplToJson(
        _$ProposedServiceModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'isPublished': instance.isPublished,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'icon': instance.icon,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
    };

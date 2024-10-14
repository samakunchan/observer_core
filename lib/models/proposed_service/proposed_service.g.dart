// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposed_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProposedServiceImpl _$$ProposedServiceImplFromJson(
        Map<String, dynamic> json) =>
    _$ProposedServiceImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      icon: json['icon'] as String,
      isPublished: json['isPublished'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProposedServiceImplToJson(
        _$ProposedServiceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'icon': instance.icon,
      'isPublished': instance.isPublished,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposed_service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProposedServiceDTOImpl _$$ProposedServiceDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$ProposedServiceDTOImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      isPublished: json['isPublished'] as bool,
      icon: json['icon'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProposedServiceDTOImplToJson(
        _$ProposedServiceDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'isPublished': instance.isPublished,
      'icon': instance.icon,
      'id': instance.id,
    };

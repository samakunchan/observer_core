// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abouts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutsDTOImpl _$$AboutsDTOImplFromJson(Map<String, dynamic> json) =>
    _$AboutsDTOImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AboutsDTOImplToJson(_$AboutsDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'id': instance.id,
    };

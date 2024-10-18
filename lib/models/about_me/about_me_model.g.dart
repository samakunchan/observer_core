// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutMeModelImpl _$$AboutMeModelImplFromJson(Map<String, dynamic> json) =>
    _$AboutMeModelImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AboutMeModelImplToJson(_$AboutMeModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'id': instance.id,
    };

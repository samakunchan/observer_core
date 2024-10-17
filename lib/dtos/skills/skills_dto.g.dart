// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillsDTOImpl _$$SkillsDTOImplFromJson(Map<String, dynamic> json) =>
    _$SkillsDTOImpl(
      techno: json['techno'] as String,
      level: json['level'] as String,
      position: json['position'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SkillsDTOImplToJson(_$SkillsDTOImpl instance) =>
    <String, dynamic>{
      'techno': instance.techno,
      'level': instance.level,
      'position': instance.position,
      'id': instance.id,
    };

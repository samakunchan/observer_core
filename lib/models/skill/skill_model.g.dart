// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillModelImpl _$$SkillModelImplFromJson(Map<String, dynamic> json) =>
    _$SkillModelImpl(
      techno: json['techno'] as String,
      level: json['level'] as String,
      position: json['position'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SkillModelImplToJson(_$SkillModelImpl instance) =>
    <String, dynamic>{
      'techno': instance.techno,
      'level': instance.level,
      'position': instance.position,
      'id': instance.id,
    };

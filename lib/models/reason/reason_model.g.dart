// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReasonModelImpl _$$ReasonModelImplFromJson(Map<String, dynamic> json) =>
    _$ReasonModelImpl(
      reason: json['reason'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReasonModelImplToJson(_$ReasonModelImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'id': instance.id,
    };

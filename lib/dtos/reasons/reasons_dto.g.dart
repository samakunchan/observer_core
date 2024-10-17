// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reasons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReasonsDTOImpl _$$ReasonsDTOImplFromJson(Map<String, dynamic> json) =>
    _$ReasonsDTOImpl(
      reason: json['reason'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReasonsDTOImplToJson(_$ReasonsDTOImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'id': instance.id,
    };

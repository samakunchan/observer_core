// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateDTOImpl _$$DateDTOImplFromJson(Map<String, dynamic> json) =>
    _$DateDTOImpl(
      dateTime: DateTime.parse(json['dateTime'] as String),
      dateFormated: json['dateFormated'] as String,
    );

Map<String, dynamic> _$$DateDTOImplToJson(_$DateDTOImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'dateFormated': instance.dateFormated,
    };

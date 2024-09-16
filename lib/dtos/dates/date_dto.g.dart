// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateDTO _$DateDTOFromJson(Map<String, dynamic> json) => DateDTO(
      dateTime: DateTime.parse(json['dateTime'] as String),
      dateFormated: json['dateFormated'] as String,
    );

Map<String, dynamic> _$DateDTOToJson(DateDTO instance) => <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'dateFormated': instance.dateFormated,
    };

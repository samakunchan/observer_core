// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpError _$HttpErrorFromJson(Map<String, dynamic> json) => HttpError(
      statusCode: json['statusCode'] as int? ?? 0,
      errorName: json['errorName'] as String? ??
          'Le nom de l‘exception n‘a pas été définis',
      description: json['description'] as String? ??
          'La description n‘a pas été définis dans les exceptions',
      path: json['path'] as String? ??
          'Le path n‘a pas été définis dans les exceptions',
      date: json['date'] as String? ??
          'La date n‘a pas été définis dans les exceptions',
    );

Map<String, dynamic> _$HttpErrorToJson(HttpError instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorName': instance.errorName,
      'description': instance.description,
      'path': instance.path,
      'date': instance.date,
    };

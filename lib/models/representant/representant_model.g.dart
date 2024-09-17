// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepresentantModelImpl _$$RepresentantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RepresentantModelImpl(
      uuid: json['uuid'] as String,
      gender: json['gender'] as String,
      isCompany: json['isCompany'] as bool,
      dateStart: json['dateStart'] as String,
      title: json['title'] as String,
      lastname: json['lastname'] as String,
      firstname: json['firstname'] as String,
      fullname: json['fullname'] as String,
    );

Map<String, dynamic> _$$RepresentantModelImplToJson(
        _$RepresentantModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'gender': instance.gender,
      'isCompany': instance.isCompany,
      'dateStart': instance.dateStart,
      'title': instance.title,
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'fullname': instance.fullname,
    };

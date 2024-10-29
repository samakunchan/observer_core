// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_delete_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryDeleteDTOImpl _$$CategoryDeleteDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryDeleteDTOImpl(
      categoriesIds: (json['categoriesIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$CategoryDeleteDTOImplToJson(
        _$CategoryDeleteDTOImpl instance) =>
    <String, dynamic>{
      'categoriesIds': instance.categoriesIds,
    };

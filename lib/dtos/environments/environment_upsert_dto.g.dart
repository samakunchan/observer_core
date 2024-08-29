// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentUpsertDto _$EnvironmentUpsertDtoFromJson(
        Map<String, dynamic> json) =>
    EnvironmentUpsertDto(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryUpsertDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnvironmentUpsertDtoToJson(
    EnvironmentUpsertDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  writeNotNull('categories', instance.categories);
  return val;
}

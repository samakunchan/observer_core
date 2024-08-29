// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_upsert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryUpsertDto _$CategoryUpsertDtoFromJson(Map<String, dynamic> json) =>
    CategoryUpsertDto(
      title: json['title'] as String,
      content: json['content'] as String,
      environment: (json['environment'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryUpsertDtoToJson(CategoryUpsertDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['content'] = instance.content;
  val['environment'] = instance.environment;
  return val;
}

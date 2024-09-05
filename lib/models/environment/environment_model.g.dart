// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentModel _$EnvironmentModelFromJson(Map<String, dynamic> json) =>
    EnvironmentModel(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnvironmentModelToJson(EnvironmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categories': instance.categories,
    };

EnvironementAssociatedModel _$EnvironementAssociatedModelFromJson(
        Map<String, dynamic> json) =>
    EnvironementAssociatedModel(
      title: json['title'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EnvironementAssociatedModelToJson(
    EnvironementAssociatedModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  return val;
}

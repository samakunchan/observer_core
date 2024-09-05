// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      title: json['title'] as String,
      slug: json['slug'] as String,
      shortDescription: json['shortDescription'] as String,
      fullDescription: json['fullDescription'] as String,
      client: json['client'] as String,
      dateDebutProjet: json['dateDebutProjet'] as String,
      dateFinProjet: json['dateFinProjet'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      deletedAt: json['deletedAt'] as String?,
      picturesProject: (json['picturesProject'] as List<dynamic>?)
              ?.map((e) => PictureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          PictureModel.listWithDefaultPicture,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['slug'] = instance.slug;
  val['shortDescription'] = instance.shortDescription;
  val['fullDescription'] = instance.fullDescription;
  val['client'] = instance.client;
  val['dateDebutProjet'] = instance.dateDebutProjet;
  val['dateFinProjet'] = instance.dateFinProjet;
  val['createdAt'] = instance.createdAt;
  val['updatedAt'] = instance.updatedAt;
  writeNotNull('deletedAt', instance.deletedAt);
  writeNotNull('picturesProject', instance.picturesProject);
  val['category'] = instance.category;
  return val;
}

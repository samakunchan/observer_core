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

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'shortDescription': instance.shortDescription,
      'fullDescription': instance.fullDescription,
      'client': instance.client,
      'dateDebutProjet': instance.dateDebutProjet,
      'dateFinProjet': instance.dateFinProjet,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'picturesProject': instance.picturesProject,
      'category': instance.category,
    };

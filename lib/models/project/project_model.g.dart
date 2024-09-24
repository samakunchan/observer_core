// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
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
      picturesProject: (json['picturesProject'] as List<dynamic>?)
              ?.map((e) => PictureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          PictureModel.listWithDefaultPicture,
      deletedAt: json['deletedAt'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'shortDescription': instance.shortDescription,
      'fullDescription': instance.fullDescription,
      'client': instance.client,
      'dateDebutProjet': instance.dateDebutProjet,
      'dateFinProjet': instance.dateFinProjet,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
      'picturesProject': instance.picturesProject,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
    };

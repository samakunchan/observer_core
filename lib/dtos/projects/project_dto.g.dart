// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectDTOImpl _$$ProjectDTOImplFromJson(Map<String, dynamic> json) =>
    _$ProjectDTOImpl(
      title: json['title'] as String,
      shortDescription: json['shortDescription'] as String,
      fullDescription: json['fullDescription'] as String,
      client: json['client'] as String,
      dateDebutProjet: json['dateDebutProjet'] as String,
      dateFinProjet: json['dateFinProjet'] as String,
      category: (json['category'] as num).toInt(),
      picturesProject: (json['picturesProject'] as List<dynamic>?)
              ?.map(
                  (e) => PicturesProjectDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectDTOImplToJson(_$ProjectDTOImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'fullDescription': instance.fullDescription,
      'client': instance.client,
      'dateDebutProjet': instance.dateDebutProjet,
      'dateFinProjet': instance.dateFinProjet,
      'category': instance.category,
      'picturesProject': instance.picturesProject,
      'id': instance.id,
    };

_$PicturesProjectDTOImpl _$$PicturesProjectDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PicturesProjectDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$PicturesProjectDTOImplToJson(
        _$PicturesProjectDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };

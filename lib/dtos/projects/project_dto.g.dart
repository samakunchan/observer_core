// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDTO _$ProjectDTOFromJson(Map<String, dynamic> json) => ProjectDTO(
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

Map<String, dynamic> _$ProjectDTOToJson(ProjectDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['shortDescription'] = instance.shortDescription;
  val['fullDescription'] = instance.fullDescription;
  val['client'] = instance.client;
  val['dateDebutProjet'] = instance.dateDebutProjet;
  val['dateFinProjet'] = instance.dateFinProjet;
  writeNotNull('picturesProject', instance.picturesProject);
  val['category'] = instance.category;
  return val;
}

PicturesProjectDTO _$PicturesProjectDTOFromJson(Map<String, dynamic> json) =>
    PicturesProjectDTO(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$PicturesProjectDTOToJson(PicturesProjectDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };

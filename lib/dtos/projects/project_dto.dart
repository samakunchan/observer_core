import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';

@JsonSerializable()
class ProjectDTO {
  const ProjectDTO({
    required this.title,
    required this.shortDescription,
    required this.fullDescription,
    required this.client,
    required this.dateDebutProjet,
    required this.dateFinProjet,
    required this.category,
    this.picturesProject = const [],
    this.id,
  });
  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'shortDescription')
  final String shortDescription;

  @JsonKey(name: 'fullDescription')
  final String fullDescription;

  @JsonKey(name: 'client')
  final String client;

  @JsonKey(name: 'dateDebutProjet')
  final String dateDebutProjet;

  @JsonKey(name: 'dateFinProjet')
  final String dateFinProjet;

  @JsonKey(name: 'picturesProject', includeIfNull: false)
  final List<PicturesProjectDTO>? picturesProject;

  @JsonKey(name: 'category')
  final int category;

  Map<String, dynamic> toJson() => _$ProjectDTOToJson(this);
}

@JsonSerializable()
class PicturesProjectDTO {
  const PicturesProjectDTO({
    required this.id,
    required this.description,
  });
  factory PicturesProjectDTO.fromJson(Map<String, dynamic> json) => _$PicturesProjectDTOFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int id;
  @JsonKey(name: 'description')
  final String description;

  Map<String, dynamic> toJson() => _$PicturesProjectDTOToJson(this);
}

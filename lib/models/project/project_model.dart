import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.slug,
    required this.shortDescription,
    required this.fullDescription,
    required this.client,
    required this.dateDebutProjet,
    required this.dateFinProjet,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    this.deletedAt,
    this.picturesProject = PictureModel.listWithDefaultPicture,
    this.id,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'slug')
  final String slug;
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
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @JsonKey(name: 'deletedAt', includeIfNull: false)
  final String? deletedAt;
  @JsonKey(name: 'picturesProject', includeIfNull: false)
  final List<PictureModel>? picturesProject;
  @JsonKey(name: 'category')
  final CategoryModel category;

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

  static const emptyList = <ProjectModel>[];
}

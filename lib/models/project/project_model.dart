import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String title,
    required String slug,
    required String shortDescription,
    required String fullDescription,
    required String client,
    required String dateDebutProjet,
    required String dateFinProjet,
    required String createdAt,
    required String updatedAt,
    required CategoryModel category,
    @Default(PictureModel.listWithDefaultPicture) List<PictureModel> picturesProject,
    String? deletedAt,
    int? id,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  static const emptyList = <ProjectModel>[];
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  /// Exemple :
  ///```dart
  /// {
  ///     "id": 1,
  ///     "title": "Un titre",
  ///     "content": "Description de la catégorie",
  ///     "projects": [],
  ///     "environment": {
  ///        "id": 3,
  ///        "title": "Titre le l'environnement associé."
  ///      }
  ///   },
  ///```
  const factory CategoryModel({
    required String title,
    required String content,
    int? id,
    @Default(ProjectModel.emptyList) List<ProjectModel> projects,
    EnvironmentAssociatedModel? environment,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  static const emptyList = <CategoryModel>[];
  static const empty = CategoryModel(title: '', content: '');
}

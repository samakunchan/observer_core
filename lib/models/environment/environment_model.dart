import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'environment_model.freezed.dart';
part 'environment_model.g.dart';

@freezed
class EnvironmentModel with _$EnvironmentModel {
  /// Exemple :
  ///```dart
  ///  {
  ///    "id": 3,
  ///    "title": "Titre de l'environnement",
  ///    "categories": [
  ///        {
  ///            "id": 1,
  ///            "title": "Titre de la catégorie",
  ///            "content": "Description de la catégorie"
  ///        },
  ///    ]
  ///  },
  ///```
  const factory EnvironmentModel({
    required String title,
    int? id,
    List<CategoryModel>? categories,
  }) = _EnvironmentModel;

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) => _$EnvironmentModelFromJson(json);

  static const emptyList = <EnvironmentModel>[];
}

@freezed
class EnvironmentAssociatedModel with _$EnvironmentAssociatedModel {
  /// Exemple :
  ///```dart
  ///  {
  ///     "id": 3,
  ///     "title": "Titre de l'environnement associer à la catégorie",
  ///  },
  ///```
  const factory EnvironmentAssociatedModel({
    required String title,
    int? id,
  }) = _EnvironmentAssociatedModel;

  factory EnvironmentAssociatedModel.fromJson(Map<String, dynamic> json) => _$EnvironmentAssociatedModelFromJson(json);
}

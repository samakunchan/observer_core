import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/dtos/dtos_export.dart';

part 'environment_upsert_dto.freezed.dart';
part 'environment_upsert_dto.g.dart';

@freezed
class EnvironmentUpsertDTO with _$EnvironmentUpsertDTO {
  /// ## Exemple
  /// ## Création d'un environnement
  /// ```dart
  /// {
  ///   "title": "Un titre"
  /// }
  /// ```
  /// ## Mise à jour d'un environnement
  /// ```dart
  /// {
  ///   "id": 1,
  ///   "title": "Un titre"
  /// }
  /// ```
  /// ## Mise à jour d'un environnement et ses catégories associées.
  /// ```dart
  /// {
  ///   "id": 1, // Requis pour la mise à jour
  ///   "title": "Un titre",
  ///   "categories": [
  ///      {
  ///        "id": 1,
  ///        "title": "Titre de la catégorie",
  ///        "content": "Description de la catégorie",
  ///        "environment": 3
  ///      }
  ///   ]
  /// }
  /// ```
  const factory EnvironmentUpsertDTO({
    required String title,
    List<CategoryUpsertDTO>? categories,
    int? id,
  }) = _EnvironmentUpsertDTO;

  factory EnvironmentUpsertDTO.fromJson(Map<String, dynamic> json) => _$EnvironmentUpsertDTOFromJson(json);

  static const emptyList = <EnvironmentUpsertDTO>[];
}

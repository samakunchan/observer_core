import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_upsert_dto.freezed.dart';
part 'category_upsert_dto.g.dart';

@freezed
class CategoryUpsertDTO with _$CategoryUpsertDTO {
  /// ## Exemple :
  ///
  /// ### Création d'une catégorie.
  /// ```dart
  /// {
  ///   "title": "Titre de la catégorie",
  ///   "content": "Description de la catégorie",
  ///   "environment": 3
  /// }
  /// ```
  /// ### Mise à jour d'une catégorie.
  /// ```dart
  /// {
  ///   "id": 1,
  ///   "title": "Titre de la catégorie",
  ///   "content": "Description de la catégorie",
  ///   "environment": 3
  /// }
  /// ```
  const factory CategoryUpsertDTO({
    required String title,
    required String content,
    required int environment,
    int? id,
  }) = _CategoryUpsertDTO;

  factory CategoryUpsertDTO.fromJson(Map<String, dynamic> json) => _$CategoryUpsertDTOFromJson(json);

  static const emptyList = <CategoryUpsertDTO>[];
}

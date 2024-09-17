import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_dto.freezed.dart';
part 'project_dto.g.dart';

@freezed
class ProjectDTO with _$ProjectDTO {
  /// ## Exemples :
  /// ### Création du projet
  /// ```dart
  /// {
  ///   "title": "Titre du projet",
  ///   "shortDescription": "Description pour le S.E.O",
  ///   "fullDescription": "Description de complète",
  ///   "client": "Nom",
  ///   "dateDebutProjet": "YYYY-MM-DD",
  ///   "dateFinProjet": "YYYY-MM-DD",
  ///   "category": 3,
  ///   "picturesProject": [
  ///      {
  ///        "id": 1,
  ///         "description": "Description de l'image",
  ///      }
  ///   ],
  /// }
  /// ```
  /// ### Mise à jour du projet
  /// ```dart
  /// {
  ///   "id": 1, // Requis pour la mise à jour
  ///   "title": "Titre du projet",
  ///   "shortDescription": "Description pour le S.E.O",
  ///   "fullDescription": "Description de complète",
  ///   "client": "Nom",
  ///   "dateDebutProjet": "YYYY-MM-DD",
  ///   "dateFinProjet": "YYYY-MM-DD",
  ///   "category": 3,
  ///   "picturesProject": [
  ///      {
  ///         "id": 1,
  ///         "description": "Description de l'image",
  ///       }
  ///   ],
  /// }
  /// ```
  const factory ProjectDTO({
    required String title,
    required String shortDescription,
    required String fullDescription,
    required String client,
    required String dateDebutProjet,
    required String dateFinProjet,
    required int category,
    @Default([]) List<PicturesProjectDTO>? picturesProject,
    int? id,
  }) = _ProjectDTO;
  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);
}

@freezed
class PicturesProjectDTO with _$PicturesProjectDTO {
  /// Juste link l'image préalablement enregistrer avec les DTO des documents
  /// ## Exemple
  /// ```dart
  /// {
  ///   "id": 1,
  ///   "description": "Description de l'image",
  /// }
  /// ```
  const factory PicturesProjectDTO({
    required int? id,
    required String description,
  }) = _PicturesProjectDTO;
  factory PicturesProjectDTO.fromJson(Map<String, dynamic> json) => _$PicturesProjectDTOFromJson(json);
}

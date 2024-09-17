import 'package:freezed_annotation/freezed_annotation.dart';

part 'one_document_upsert_dto.freezed.dart';
part 'one_document_upsert_dto.g.dart';

@freezed
class OneDocumentUpsertDTO with _$OneDocumentUpsertDTO {
  /// ## Exemples :
  /// ```dart
  /// ### Ajout d'un fichier
  /// {
  ///   "size": 2343,
  ///   "mimetype": "image/png",
  ///   "filename": "image.png",
  ///   "description": "Utile pour l'attribut 'alt' lors de la construction du front",
  ///   "folder": "images",
  ///   "path": "images/image.png",
  /// }
  /// ```
  /// ### Mise à jour d'un fichier
  /// {
  ///   "id": 1, // Requis pour la mise à jour
  ///   "size": 2343,
  ///   "mimetype": "image/png",
  ///   "filename": "image.png",
  ///   "description": "Utile pour l'attribut 'alt' lors de la construction du front",
  ///   "folder": "images",
  ///   "path": "images/image.png",
  /// }
  /// ```
  const factory OneDocumentUpsertDTO({
    required String mimetype,
    required String filename,
    required String description,
    required String folder,
    required String path,
    required int size,
    int? id,
  }) = _OneDocumentUpsertDTO;

  factory OneDocumentUpsertDTO.fromJson(Map<String, dynamic> json) => _$OneDocumentUpsertDTOFromJson(json);

  static const emptyList = <OneDocumentUpsertDTO>[];
}

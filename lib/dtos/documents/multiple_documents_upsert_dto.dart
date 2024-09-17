import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/dtos/documents/one_document_upsert_dto.dart';

part 'multiple_documents_upsert_dto.freezed.dart';
part 'multiple_documents_upsert_dto.g.dart';

@freezed
class MultipleDocumentsUpsertDTO with _$MultipleDocumentsUpsertDTO {
  /// ## Exemple
  /// ```dart
  /// [
  ///    {
  ///      "id": 1,
  ///      "size": 2343,
  ///      "mimetype": "image/png",
  ///      "filename": "image1.png",
  ///      "description": "Utile pour l'attribut 'alt' lors de la construction du front",
  ///      "folder": "images",
  ///      "path": "images/image1.png",
  ///    },
  ///    {
  ///      "id": 2,
  ///      "size": 2343,
  ///      "mimetype": "image/png",
  ///      "filename": "image2.png",
  ///      "description": "Utile pour l'attribut 'alt' lors de la construction du front",
  ///      "folder": "images",
  ///      "path": "images/image2.png",
  ///    }
  /// ]
  /// ```
  const factory MultipleDocumentsUpsertDTO({required List<OneDocumentUpsertDTO> documents}) = _MultipleDocumentsUpsertDTO;

  factory MultipleDocumentsUpsertDTO.fromJson(Map<String, dynamic> json) => _$MultipleDocumentsUpsertDTOFromJson(json);

  // final List<OneDocumentUpsertDTO> documents;
  //
  // Map<String, dynamic> toJson() => _$MultipleDocumentsUpsertDtoToJson(this);
}

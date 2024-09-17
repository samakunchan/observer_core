import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

@freezed
class DocumentModel with _$DocumentModel {
  /// Exemple :
  /// ```dart
  /// {
  ///   "mimetype": "image/png",
  ///   "filename": "my-image.png",
  ///   "folder": "xxxxxxx-files/images",
  ///   "path": xxxxxxx-files/images/my-image.png",
  ///   "size": 1181883,
  ///   "description": "no description",
  ///   "id": 1 # Optionnel
  /// ```
  /// },
  const factory DocumentModel({
    required String mimetype,
    required String filename,
    required String description,
    required String folder,
    required String path,
    required int size,
    int? id,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, dynamic> json) => _$DocumentModelFromJson(json);

  static const empty = DocumentModel(
    mimetype: '',
    filename: '',
    description: '',
    folder: '',
    path: '',
    size: 0,
  );
}

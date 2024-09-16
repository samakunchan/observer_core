import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
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
  const DocumentModel({
    required this.mimetype,
    required this.filename,
    required this.description,
    required this.folder,
    required this.path,
    required this.size,
    this.id,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) => _$DocumentModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'mimetype')
  final String mimetype;
  @JsonKey(name: 'filename')
  final String filename;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'folder')
  final String folder;
  @JsonKey(name: 'path')
  final String path;
  @JsonKey(name: 'size')
  final int size;

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);

  static const empty = DocumentModel(
    mimetype: '',
    filename: '',
    description: '',
    folder: '',
    path: '',
    size: 0,
  );
}

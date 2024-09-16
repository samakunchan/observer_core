// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    DocumentModel(
      mimetype: json['mimetype'] as String,
      filename: json['filename'] as String,
      description: json['description'] as String,
      folder: json['folder'] as String,
      path: json['path'] as String,
      size: (json['size'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DocumentModelToJson(DocumentModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['mimetype'] = instance.mimetype;
  val['filename'] = instance.filename;
  val['description'] = instance.description;
  val['folder'] = instance.folder;
  val['path'] = instance.path;
  val['size'] = instance.size;
  return val;
}

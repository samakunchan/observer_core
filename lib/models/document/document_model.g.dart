// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
      mimetype: json['mimetype'] as String,
      filename: json['filename'] as String,
      description: json['description'] as String,
      folder: json['folder'] as String,
      path: json['path'] as String,
      size: (json['size'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      'mimetype': instance.mimetype,
      'filename': instance.filename,
      'description': instance.description,
      'folder': instance.folder,
      'path': instance.path,
      'size': instance.size,
      'id': instance.id,
    };

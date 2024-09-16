import 'package:json_annotation/json_annotation.dart';

part 'one_document_upsert_dto_dto.g.dart';

@JsonSerializable()
class OneDocumentUpsertDto {
  const OneDocumentUpsertDto({
    required this.mimetype,
    required this.filename,
    required this.description,
    required this.folder,
    required this.path,
    required this.size,
    this.id,
  });

  factory OneDocumentUpsertDto.fromJson(Map<String, dynamic> json) => _$OneDocumentUpsertDtoFromJson(json);

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
  final String size;

  Map<String, dynamic> toJson() => _$OneDocumentUpsertDtoToJson(this);

  static const emptyList = <OneDocumentUpsertDto>[];
}

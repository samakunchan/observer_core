import 'package:json_annotation/json_annotation.dart';

part 'category_upsert_dto.g.dart';

@JsonSerializable()
class CategoryUpsertDto {
  const CategoryUpsertDto({
    required this.title,
    required this.content,
    required this.environment,
    this.id,
  });

  factory CategoryUpsertDto.fromJson(Map<String, dynamic> json) => _$CategoryUpsertDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'environment')
  final int environment;

  Map<String, dynamic> toJson() => _$CategoryUpsertDtoToJson(this);

  static const emptyList = <CategoryUpsertDto>[];
}

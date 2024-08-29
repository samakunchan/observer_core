import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/dtos/dtos.dart';

part 'environment_upsert_dto.g.dart';

@JsonSerializable()
class EnvironmentUpsertDto {
  const EnvironmentUpsertDto({
    required this.title,
    this.id,
    this.categories,
  });

  factory EnvironmentUpsertDto.fromJson(Map<String, dynamic> json) => _$EnvironmentUpsertDtoFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'categories', includeIfNull: false)
  final List<CategoryUpsertDto>? categories;

  Map<String, dynamic> toJson() => _$EnvironmentUpsertDtoToJson(this);

  static const emptyList = <EnvironmentUpsertDto>[];
}

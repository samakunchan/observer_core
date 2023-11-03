import 'package:json_annotation/json_annotation.dart';

part 'environment_upsert_dto.g.dart';

@JsonSerializable()
class EnvironmentUpsertDto {
  const EnvironmentUpsertDto({
    required this.title,
    this.id,
  });

  factory EnvironmentUpsertDto.fromJson(Map<String, dynamic> json) => _$EnvironmentUpsertDtoFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String title;

  Map<String, dynamic> toJson() => _$EnvironmentUpsertDtoToJson(this);

  static const emptyList = <EnvironmentUpsertDto>[];
}

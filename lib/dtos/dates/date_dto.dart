import 'package:json_annotation/json_annotation.dart';

part 'date_dto.g.dart';

@JsonSerializable()
class DateDTO {
  const DateDTO({
    required this.dateTime,
    required this.dateFormated,
  });

  factory DateDTO.fromJson(Map<String, dynamic> json) => _$DateDTOFromJson(json);

  @JsonKey(name: 'dateTime')
  final DateTime dateTime;

  @JsonKey(name: 'dateFormated')
  final String dateFormated;

  Map<String, dynamic> toJson() => _$DateDTOToJson(this);
}

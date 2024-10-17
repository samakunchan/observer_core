import 'package:freezed_annotation/freezed_annotation.dart';

part 'reasons_dto.freezed.dart';
part 'reasons_dto.g.dart';

@freezed
class ReasonsDTO with _$ReasonsDTO {
  const factory ReasonsDTO({
    required String reason,
    int? id,
  }) = _ReasonsDTO;

  factory ReasonsDTO.fromJson(Map<String, dynamic> json) => _$ReasonsDTOFromJson(json);

  static const emptyList = <ReasonsDTO>[];
}

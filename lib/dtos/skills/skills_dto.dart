import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_dto.freezed.dart';
part 'skills_dto.g.dart';

@freezed
class SkillsDTO with _$SkillsDTO {
  const factory SkillsDTO({
    required String techno,
    required String level,
    required String position,
    int? id,
  }) = _SkillsDTO;

  factory SkillsDTO.fromJson(Map<String, dynamic> json) => _$SkillsDTOFromJson(json);

  static const emptyList = <SkillsDTO>[];
}

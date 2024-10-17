import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class SkillModel with _$SkillModel {
  const factory SkillModel({
    required String techno,
    required String level,
    required String position,
    int? id,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);

  static const emptyList = <SkillModel>[];
}

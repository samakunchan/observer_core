import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'environment_delete_dto.freezed.dart';
part 'environment_delete_dto.g.dart';

@freezed
class EnvironmentDeleteDTO with _$EnvironmentDeleteDTO {
  const factory EnvironmentDeleteDTO({
    required String title,
    int? id,
    List<CategoryModel>? categories,
  }) = _CategoryDeleteDTO;
  factory EnvironmentDeleteDTO.fromJson(Map<String, dynamic> json) => _$EnvironmentDeleteDTOFromJson(json);
}

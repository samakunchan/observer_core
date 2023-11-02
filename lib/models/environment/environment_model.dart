import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'environment_model.g.dart';

@JsonSerializable()
class EnvironmentModel {
  const EnvironmentModel({
    required this.title,
    this.id,
    this.categories,
  });

  factory EnvironmentModel.fromJson(Map<String, dynamic> json) => _$EnvironmentModelFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'categories')
  final List<CategoryModel>? categories;

  Map<String, dynamic> toJson() => _$EnvironmentModelToJson(this);

  static const emptyList = <EnvironmentModel>[];
}

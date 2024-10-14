import 'package:freezed_annotation/freezed_annotation.dart';

part 'proposed_service_model.freezed.dart';
part 'proposed_service_model.g.dart';

@freezed
class ProposedServiceModel with _$ProposedServiceModel {
  const factory ProposedServiceModel({
    required String title,
    required String content,
    required String icon,
    required bool isPublished,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    int? id,
  }) = _ProposedServiceModel;

  factory ProposedServiceModel.fromJson(Map<String, dynamic> json) => _$ProposedServiceModelFromJson(json);

  static const emptyList = <ProposedServiceModel>[];
}

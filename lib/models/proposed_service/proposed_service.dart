import 'package:freezed_annotation/freezed_annotation.dart';

part 'proposed_service.freezed.dart';
part 'proposed_service.g.dart';

@freezed
class ProposedService with _$ProposedService {
  const factory ProposedService({
    required String title,
    required String content,
    required String icon,
    required bool isPublished,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    int? id,
  }) = _ProposedService;

  factory ProposedService.fromJson(Map<String, dynamic> json) => _$ProposedServiceFromJson(json);

  static const emptyList = <ProposedService>[];
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_delete_dto.freezed.dart';
part 'category_delete_dto.g.dart';

@freezed
class CategoryDeleteDTO with _$CategoryDeleteDTO {
  const factory CategoryDeleteDTO({
    required List<int> categoriesIds,
  }) = _CategoryDeleteDTO;
  factory CategoryDeleteDTO.fromJson(Map<String, dynamic> json) => _$CategoryDeleteDTOFromJson(json);
}

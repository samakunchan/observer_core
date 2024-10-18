import 'package:freezed_annotation/freezed_annotation.dart';

part 'abouts_dto.freezed.dart';
part 'abouts_dto.g.dart';

@freezed
class AboutsDTO with _$AboutsDTO {
  const factory AboutsDTO({
    required String title,
    required String content,
    int? id,
  }) = _AboutsDTO;

  factory AboutsDTO.fromJson(Map<String, dynamic> json) => _$AboutsDTOFromJson(json);

  static const emptyList = <AboutsDTO>[];
}

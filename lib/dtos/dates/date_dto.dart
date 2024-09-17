import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_dto.freezed.dart';
part 'date_dto.g.dart';

@freezed
class DateDTO with _$DateDTO {
  /// Pour parser les dates plus facilement.
  /// ## Exemple
  /// ```dart
  /// {
  ///   "dateTime": DateTime.now() # ou DateTime.parse(date),
  ///   "dateFormated": "2024-01-01",
  /// }
  /// ```
  const factory DateDTO({
    required DateTime dateTime,
    required String dateFormated,
  }) = _DateDTO;

  factory DateDTO.fromJson(Map<String, dynamic> json) => _$DateDTOFromJson(json);
}

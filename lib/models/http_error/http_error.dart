import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_error.freezed.dart';
part 'http_error.g.dart';

@freezed
class HttpError with _$HttpError {
  /// Exemple :
  /// ```
  /// {
  ///    "statusCode": 0,
  ///    "errorName": "XXXXXXXException",
  ///    "description": 'Description de l'érreur.',
  ///    "path": '/',
  ///    "date": '',
  /// }
  /// ```
  const factory HttpError({
    @Default(0) int statusCode,
    @Default('Le nom de l‘exception n‘a pas été définis') String errorName,
    @Default('La description n‘a pas été définis dans les exceptions') String description,
    @Default('Le path n‘a pas été définis dans les exceptions') String path,
    @Default('La date n‘a pas été définis dans les exceptions') String date,
  }) = _HttpError;

  factory HttpError.fromJson(Map<String, dynamic> json) => _$HttpErrorFromJson(json);

  static const Map<String, dynamic> customNotFoundError = <String, dynamic>{
    'statusCode': 404,
    'errorName': 'NotFoundException',
    'description': 'La route est introuvable.',
    'path': '/',
    'date': '',
  };
}

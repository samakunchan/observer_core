import 'package:json_annotation/json_annotation.dart';

part 'http_error.g.dart';

@JsonSerializable()
class HttpError {
  const HttpError({
    this.statusCode = 0,
    this.errorName = 'Le nom de l‘exception n‘a pas été définis',
    this.description = 'La description n‘a pas été définis dans les exceptions',
    this.path = 'Le path n‘a pas été définis dans les exceptions',
    this.date = 'La date n‘a pas été définis dans les exceptions',
  });

  factory HttpError.fromJson(Map<String, dynamic> json) => _$HttpErrorFromJson(json);

  @JsonKey(name: 'statusCode')
  final int statusCode;
  @JsonKey(name: 'errorName')
  final String errorName;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'path')
  final String path;
  @JsonKey(name: 'date')
  final String date;

  Map<String, dynamic> toJson() => _$HttpErrorToJson(this);

  static const Map<String, dynamic> customNotFoundError = <String, dynamic>{
    'statusCode': 404,
    'errorName': 'NotFoundException',
    'description': 'La route est introuvable.',
    'path': '/',
    'date': '',
  };
}

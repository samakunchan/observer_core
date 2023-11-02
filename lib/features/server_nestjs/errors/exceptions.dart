import 'package:observer_core/models/models_export.dart';

class ServerException implements Exception {}

class NotFoundException implements Exception {
  const NotFoundException({this.httpError = const HttpError()});
  final HttpError httpError;
}

class UnAuthorizedException implements Exception {
  const UnAuthorizedException({this.httpError = const HttpError()});
  final HttpError httpError;
}

class ForbiddenException implements Exception {
  const ForbiddenException({this.httpError = const HttpError()});
  final HttpError httpError;
}

class ParseException implements Exception {}

class CacheException implements Exception {}

class OidcException implements Exception {}

class BadRequestException implements Exception {
  const BadRequestException({this.httpError = const HttpError()});
  final HttpError httpError;
}

class IDontKnowWhatImDoingException implements Exception {}

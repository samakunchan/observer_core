import 'package:equatable/equatable.dart';

class UpsertParams extends Equatable {
  const UpsertParams({required this.accessToken, required this.endPoint, required this.body});

  final String accessToken;
  final String body;
  final String endPoint;

  @override
  List<Object> get props => [accessToken, endPoint, body];
}

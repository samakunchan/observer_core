import 'package:equatable/equatable.dart';

class DeleteParams extends Equatable {
  const DeleteParams({required this.accessToken, required this.body, required this.endPoint});

  final String accessToken;
  final String body;
  final String endPoint;

  @override
  List<Object> get props => [accessToken, body, endPoint];
}

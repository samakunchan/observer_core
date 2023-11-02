import 'package:equatable/equatable.dart';

class GetParams extends Equatable {
  const GetParams({required this.accessToken, required this.endPoint});

  final String accessToken;
  final String endPoint;

  @override
  List<Object> get props => [accessToken, endPoint];
}

import 'package:equatable/equatable.dart';

class SearchParams extends Equatable {
  const SearchParams({required this.accessToken, required this.endPoint, required this.input, this.strictMode = false});

  final String accessToken;
  final String endPoint;
  final String input;
  final bool strictMode;

  @override
  List<Object> get props => [accessToken, input, endPoint];
}

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UploadFormDataParams extends Equatable {
  const UploadFormDataParams({required this.accessToken, required this.endPoint, required this.formData});

  final String accessToken;
  final String endPoint;
  final FormData formData;

  @override
  List<Object> get props => [accessToken, formData, endPoint];
}

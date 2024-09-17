import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required int total,
    required List<SearchResultModel> results,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);
}

@freezed
class SearchResultModel with _$SearchResultModel {
  const factory SearchResultModel({
    required int id,
    required String title,
  }) = _SearchResultModel;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);
}

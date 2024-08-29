import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  const SearchModel({
    required this.total,
    required this.results,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'results')
  final List<SearchResultModel> results;

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class SearchResultModel {
  const SearchResultModel({
    required this.id,
    required this.title,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  const ArticleModel({
    required this.title,
    required this.slug,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.picture,
    required this.category,
    this.id,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'slug')
  final String slug;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'createdAt')
  final String createdAt;
  @JsonKey(name: 'updatedAt')
  final String updatedAt;
  @JsonKey(name: 'deletedAt')
  final String? deletedAt;
  @JsonKey(name: 'picture')
  final PictureModel picture;
  @JsonKey(name: 'category')
  final CategoryModel category;

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  static const List<ArticleModel> emptyList = <ArticleModel>[];
}

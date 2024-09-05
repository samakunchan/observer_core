import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  const CategoryModel({
    required this.title,
    required this.content,
    this.id,
    this.articles = ArticleModel.emptyList,
    this.projects = ProjectModel.emptyList,
    this.environment,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  @JsonKey(name: 'id', includeIfNull: false)
  final int? id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'articles')
  final List<ArticleModel> articles;
  @JsonKey(name: 'projects')
  final List<ProjectModel> projects;
  @JsonKey(name: 'environment', includeIfNull: false)
  final EnvironementAssociatedModel? environment;

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  static const emptyList = <CategoryModel>[];
  static const empty = CategoryModel(title: '', content: '');
}

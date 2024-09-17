import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required String title,
    required String slug,
    required String description,
    required String createdAt,
    required String updatedAt,
    required String deletedAt,
    required PictureModel picture,
    required CategoryModel category,
    int? id,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  static const List<ArticleModel> emptyList = <ArticleModel>[];
}

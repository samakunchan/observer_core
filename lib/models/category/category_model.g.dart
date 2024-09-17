// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      id: (json['id'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          ArticleModel.emptyList,
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          ProjectModel.emptyList,
      environment: json['environment'] == null
          ? null
          : EnvironmentAssociatedModel.fromJson(
              json['environment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'id': instance.id,
      'articles': instance.articles,
      'projects': instance.projects,
      'environment': instance.environment,
    };

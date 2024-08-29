// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      total: (json['total'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results,
    };

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

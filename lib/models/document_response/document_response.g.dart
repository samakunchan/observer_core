// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentResponseImpl _$$DocumentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DocumentResponseImpl(
      total: (json['total'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DocumentResponseImplToJson(
        _$DocumentResponseImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganisationModelImpl _$$OrganisationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganisationModelImpl(
      siren: json['siren'] as String,
      companyName: json['companyName'] as String,
      codeNaf: json['codeNaf'] as String,
      codeNafLabel: json['codeNafLabel'] as String,
      activity: json['activity'] as String,
      createdAt: json['createdAt'] as String,
      legalCategory: (json['legalCategory'] as num).toInt(),
      legalForm: json['legalForm'] as String,
      isHiring: json['isHiring'] as bool,
      capital: (json['capital'] as num).toInt(),
      lastUpdateToSiren: json['lastUpdateToSiren'] as String,
      lastRecord: json['lastRecord'] as String,
      vta: json['vta'] as String,
      representants: (json['representants'] as List<dynamic>)
          .map((e) => RepresentantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      siege: SiegeModel.fromJson(json['siege'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OrganisationModelImplToJson(
        _$OrganisationModelImpl instance) =>
    <String, dynamic>{
      'siren': instance.siren,
      'companyName': instance.companyName,
      'codeNaf': instance.codeNaf,
      'codeNafLabel': instance.codeNafLabel,
      'activity': instance.activity,
      'createdAt': instance.createdAt,
      'legalCategory': instance.legalCategory,
      'legalForm': instance.legalForm,
      'isHiring': instance.isHiring,
      'capital': instance.capital,
      'lastUpdateToSiren': instance.lastUpdateToSiren,
      'lastRecord': instance.lastRecord,
      'vta': instance.vta,
      'representants': instance.representants,
      'siege': instance.siege,
      'id': instance.id,
    };

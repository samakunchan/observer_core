// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganisationModelImpl _$$OrganisationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganisationModelImpl(
      siren: (json['siren'] as num).toInt(),
      companyName: json['nom_entreprise'] as String,
      codeNaf: json['code_naf'] as String,
      codeNafLabel: json['libelle_code_naf'] as String,
      activity: json['domaine_activite'] as String,
      createdAt: json['date_creation'] as String,
      legalCategory: (json['categorie_juridique'] as num).toInt(),
      legalForm: json['forme_juridique'] as String,
      isHiring: json['entreprise_employeuse'] as bool,
      capital: (json['capital'] as num).toInt(),
      lastUpdateToSiren: json['derniere_mise_a_jour_sirene'] as String,
      lastRecord: json['dernier_traitement'] as String,
      vta: json['numero_tva_intracommunautaire'] as String,
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
      'nom_entreprise': instance.companyName,
      'code_naf': instance.codeNaf,
      'libelle_code_naf': instance.codeNafLabel,
      'domaine_activite': instance.activity,
      'date_creation': instance.createdAt,
      'categorie_juridique': instance.legalCategory,
      'forme_juridique': instance.legalForm,
      'entreprise_employeuse': instance.isHiring,
      'capital': instance.capital,
      'derniere_mise_a_jour_sirene': instance.lastUpdateToSiren,
      'dernier_traitement': instance.lastRecord,
      'numero_tva_intracommunautaire': instance.vta,
      'representants': instance.representants,
      'siege': instance.siege,
      'id': instance.id,
    };

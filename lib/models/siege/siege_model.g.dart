// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siege_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SiegeModel _$SiegeModelFromJson(Map<String, dynamic> json) => SiegeModel(
      siret: json['siret'] as String,
      streetNumber: json['numero_voie'] as int,
      indiceRepetition: json['indice_repetition'] as String?,
      streetType: json['type_voie'] as String,
      streetLabel: json['libelle_voie'] as String,
      additionnalAddressInfos: json['complement_adresse'] as String,
      address1: json['adresse_ligne_1'] as String,
      address2: json['adresse_ligne_2'] as String,
      zipCode: json['code_postal'] as String,
      city: json['ville'] as String,
      country: json['pays'] as String,
      countryCode: json['code_pays'] as String,
      lat: json['latitude'] as String,
      lng: json['longitude'] as String,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SiegeModelToJson(SiegeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'siret': instance.siret,
      'numero_voie': instance.streetNumber,
      'indice_repetition': instance.indiceRepetition,
      'type_voie': instance.streetType,
      'libelle_voie': instance.streetLabel,
      'complement_adresse': instance.additionnalAddressInfos,
      'adresse_ligne_1': instance.address1,
      'adresse_ligne_2': instance.address2,
      'code_postal': instance.zipCode,
      'ville': instance.city,
      'pays': instance.country,
      'code_pays': instance.countryCode,
      'latitude': instance.lat,
      'longitude': instance.lng,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siege_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiegeModelImpl _$$SiegeModelImplFromJson(Map<String, dynamic> json) =>
    _$SiegeModelImpl(
      siret: json['siret'] as String,
      streetNumber: (json['numero_voie'] as num).toInt(),
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
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SiegeModelImplToJson(_$SiegeModelImpl instance) =>
    <String, dynamic>{
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
      'id': instance.id,
    };

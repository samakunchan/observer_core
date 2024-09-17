// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siege_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiegeModelImpl _$$SiegeModelImplFromJson(Map<String, dynamic> json) =>
    _$SiegeModelImpl(
      siret: json['siret'] as String,
      streetNumber: (json['streetNumber'] as num).toInt(),
      indiceRepetition: json['indiceRepetition'] as String,
      streetType: json['streetType'] as String,
      streetLabel: json['streetLabel'] as String,
      additionnalAddressInfos: json['additionnalAddressInfos'] as String,
      address1: json['address1'] as String,
      address2: json['address2'] as String,
      zipCode: json['zipCode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      countryCode: json['countryCode'] as String,
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SiegeModelImplToJson(_$SiegeModelImpl instance) =>
    <String, dynamic>{
      'siret': instance.siret,
      'streetNumber': instance.streetNumber,
      'indiceRepetition': instance.indiceRepetition,
      'streetType': instance.streetType,
      'streetLabel': instance.streetLabel,
      'additionnalAddressInfos': instance.additionnalAddressInfos,
      'address1': instance.address1,
      'address2': instance.address2,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
    };

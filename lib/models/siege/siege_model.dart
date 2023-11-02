import 'package:json_annotation/json_annotation.dart';

part 'siege_model.g.dart';

@JsonSerializable()
class SiegeModel {
  const SiegeModel({
    required this.siret,
    required this.streetNumber,
    required this.indiceRepetition,
    required this.streetType,
    required this.streetLabel,
    required this.additionnalAddressInfos,
    required this.address1,
    required this.address2,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.countryCode,
    required this.lat,
    required this.lng,
    this.id,
  });

  factory SiegeModel.fromJson(Map<String, dynamic> json) => _$SiegeModelFromJson(json);
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'siret')
  final String siret;

  @JsonKey(name: 'numero_voie')
  final int streetNumber;

  @JsonKey(name: 'indice_repetition')
  final String? indiceRepetition;

  @JsonKey(name: 'type_voie')
  final String streetType;

  @JsonKey(name: 'libelle_voie')
  final String streetLabel;

  @JsonKey(name: 'complement_adresse')
  final String additionnalAddressInfos;

  @JsonKey(name: 'adresse_ligne_1')
  final String address1;

  @JsonKey(name: 'adresse_ligne_2')
  final String address2;

  @JsonKey(name: 'code_postal')
  final String zipCode;

  @JsonKey(name: 'ville')
  final String city;

  @JsonKey(name: 'pays')
  final String country;

  @JsonKey(name: 'code_pays')
  final String countryCode;

  @JsonKey(name: 'latitude')
  final String lat;

  @JsonKey(name: 'longitude')
  final String lng;

  Map<String, dynamic> toJson() => _$SiegeModelToJson(this);
}

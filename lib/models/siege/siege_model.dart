import 'package:freezed_annotation/freezed_annotation.dart';

part 'siege_model.freezed.dart';
part 'siege_model.g.dart';

@freezed
class SiegeModel with _$SiegeModel {
  /// Exemple :
  ///```dart
  ///{
  ///   "id": 1,
  ///   "siret": "Numéro a 14 chiffres",
  ///   "numero_voie": 10 ,
  ///   "indice_repetition": null,
  ///   "type_voie": "",
  ///   "libelle_voie": "",
  ///   "complement_adresse": "",
  ///   "adresse_ligne_1": "",
  ///   "adresse_ligne_2": "",
  ///   "code_postal": "",
  ///   "ville": "",
  ///   "pays": "France",
  ///   "code_pays": "FR",
  ///   "latitude": "",
  ///   "longitude": ""
  ///}
  ///```
  const factory SiegeModel({
    required String siret,
    @JsonKey(name: 'numero_voie') required int streetNumber,
    @JsonKey(name: 'type_voie') required String streetType,
    @JsonKey(name: 'libelle_voie') required String streetLabel,
    @JsonKey(name: 'complement_adresse') required String additionnalAddressInfos,
    @JsonKey(name: 'adresse_ligne_1') required String address1,
    @JsonKey(name: 'adresse_ligne_2') required String address2,
    @JsonKey(name: 'code_postal') required String zipCode,
    @JsonKey(name: 'ville') required String city,
    @JsonKey(name: 'pays') required String country,
    @JsonKey(name: 'code_pays') required String countryCode,
    @JsonKey(name: 'latitude') required String lat,
    @JsonKey(name: 'longitude') required String lng,
    @JsonKey(name: 'indice_repetition') String? indiceRepetition,
    int? id,
  }) = _SiegeModel;

  factory SiegeModel.fromJson(Map<String, dynamic> json) => _$SiegeModelFromJson(json);
}

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
    required int streetNumber,
    required String indiceRepetition,
    required String streetType,
    required String streetLabel,
    required String additionnalAddressInfos,
    required String address1,
    required String address2,
    required String zipCode,
    required String city,
    required String country,
    required String countryCode,
    required String lat,
    required String lng,
    int? id,
  }) = _SiegeModel;

  factory SiegeModel.fromJson(Map<String, dynamic> json) => _$SiegeModelFromJson(json);
}

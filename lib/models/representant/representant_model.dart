import 'package:freezed_annotation/freezed_annotation.dart';

part 'representant_model.freezed.dart';
part 'representant_model.g.dart';

@freezed
class RepresentantModel with _$RepresentantModel {
  /// Exemple :
  /// ```dart
  /// {
  ///     "uuid": "XXXX-XXX-XXXX-XXX-XXXXX",
  ///     "qualite": "M",
  ///     "personne_morale": false,
  ///     "date_prise_de_poste": "2018-09-10",
  ///     "titre": "Monsieur",
  ///     "nom": "Nom de famille",
  ///     "prenom": "Prénoms",
  ///     "nom_complet": "John Doe"
  /// }
  /// ```
  const factory RepresentantModel({
    required String uuid,
    required String gender,
    required bool isCompany,
    required String dateStart,
    required String title,
    required String lastname,
    required String firstname,
    required String fullname,
  }) = _RepresentantModel;

  factory RepresentantModel.fromJson(Map<String, dynamic> json) => _$RepresentantModelFromJson(json);
}

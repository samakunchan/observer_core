import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'organisation_model.freezed.dart';
part 'organisation_model.g.dart';

@freezed
class OrganisationModel with _$OrganisationModel {
  /// Exemple :
  /// ```dart
  /// {
  ///    "id": 1,
  ///    "siren": 842127201,
  ///    "nom_entreprise": "",
  ///    "code_naf": "99999",
  ///    "libelle_code_naf": "Informatique",
  ///    "domaine_activite": "Informatique",
  ///    "date_creation": "2018-09-12",
  ///    "categorie_juridique": 1000,
  ///    "forme_juridique": "Entreprise individuel",
  ///    "entreprise_employeuse": false,
  ///    "capital": 10000000,
  ///    "derniere_mise_a_jour_sirene": "2018-09-12",
  ///    "dernier_traitement": "2018-09-10",
  ///    "numero_tva_intracommunautaire": "",
  /// }
  /// ```
  const factory OrganisationModel({
    required String siren,
    required String companyName,
    required String codeNaf,
    required String codeNafLabel,
    required String activity,
    required String createdAt,
    required int legalCategory,
    required String legalForm,
    required bool isHiring,
    required int capital,
    required String lastUpdateToSiren,
    required String lastRecord,
    required String vta,
    required List<RepresentantModel> representants,
    required SiegeModel siege,
    int? id,
  }) = _OrganisationModel;

  factory OrganisationModel.fromJson(Map<String, dynamic> json) => _$OrganisationModelFromJson(json);
}

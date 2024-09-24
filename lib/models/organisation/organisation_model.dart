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
    required int siren,
    @JsonKey(name: 'nom_entreprise') required String companyName,
    @JsonKey(name: 'code_naf') required String codeNaf,
    @JsonKey(name: 'libelle_code_naf') required String codeNafLabel,
    @JsonKey(name: 'domaine_activite') required String activity,
    @JsonKey(name: 'date_creation') required String createdAt,
    @JsonKey(name: 'categorie_juridique') required int legalCategory,
    @JsonKey(name: 'forme_juridique') required String legalForm,
    @JsonKey(name: 'entreprise_employeuse') required bool isHiring,
    required int capital,
    @JsonKey(name: 'derniere_mise_a_jour_sirene') required String lastUpdateToSiren,
    @JsonKey(name: 'dernier_traitement') required String lastRecord,
    @JsonKey(name: 'numero_tva_intracommunautaire') required String vta,
    required List<RepresentantModel> representants,
    required SiegeModel siege,
    int? id,
  }) = _OrganisationModel;

  factory OrganisationModel.fromJson(Map<String, dynamic> json) => _$OrganisationModelFromJson(json);
}

//   @JsonKey(name: 'id')
//   final int? id;
//
//   @JsonKey(name: 'siren')
//   final int siren;
//
//   @JsonKey(name: 'nom_entreprise')
//   final String companyName;
//
//   @JsonKey(name: 'code_naf')
//   final String codeNaf;
//
//   @JsonKey(name: 'libelle_code_naf')
//   final String codeNafLabel;
//
//   @JsonKey(name: 'domaine_activite')
//   final String activity;
//
//   @JsonKey(name: 'date_creation')
//   final String createdAt;
//
//   @JsonKey(name: 'categorie_juridique')
//   final int legalCategory;
//
//   @JsonKey(name: 'forme_juridique')
//   final String legalForm;
//
//   @JsonKey(name: 'entreprise_employeuse')
//   final bool isHiring;
//
//   @JsonKey(name: 'capital')
//   final int capital;
//
//   @JsonKey(name: 'derniere_mise_a_jour_sirene')
//   final String lastUpdateToSiren;
//
//   @JsonKey(name: 'dernier_traitement')
//   final String lastRecord;
//
//   @JsonKey(name: 'numero_tva_intracommunautaire')
//   final String vta;
//
//   @JsonKey(name: 'representants')
//   final List<RepresentantModel> representants;
//
//   @JsonKey(name: 'siege')
//   final SiegeModel siege;

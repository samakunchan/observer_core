import 'package:json_annotation/json_annotation.dart';
import 'package:observer_core/models/models_export.dart';

part 'organisation_model.g.dart';

@JsonSerializable()
class OrganisationModel {
  const OrganisationModel({
    required this.siren,
    required this.companyName,
    required this.codeNaf,
    required this.codeNafLabel,
    required this.activity,
    required this.createdAt,
    required this.legalCategory,
    required this.legalForm,
    required this.isHiring,
    required this.capital,
    required this.lastUpdateToSiren,
    required this.lastRecord,
    required this.vta,
    required this.representants,
    required this.siege,
    this.id,
  });

  factory OrganisationModel.fromJson(Map<String, dynamic> json) => _$OrganisationModelFromJson(json);

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'siren')
  final int siren;

  @JsonKey(name: 'nom_entreprise')
  final String companyName;

  @JsonKey(name: 'code_naf')
  final String codeNaf;

  @JsonKey(name: 'libelle_code_naf')
  final String codeNafLabel;

  @JsonKey(name: 'domaine_activite')
  final String activity;

  @JsonKey(name: 'date_creation')
  final String createdAt;

  @JsonKey(name: 'categorie_juridique')
  final int legalCategory;

  @JsonKey(name: 'forme_juridique')
  final String legalForm;

  @JsonKey(name: 'entreprise_employeuse')
  final bool isHiring;

  @JsonKey(name: 'capital')
  final int capital;

  @JsonKey(name: 'derniere_mise_a_jour_sirene')
  final String lastUpdateToSiren;

  @JsonKey(name: 'dernier_traitement')
  final String lastRecord;

  @JsonKey(name: 'numero_tva_intracommunautaire')
  final String vta;

  @JsonKey(name: 'representants')
  final List<RepresentantModel> representants;

  @JsonKey(name: 'siege')
  final SiegeModel siege;

  Map<String, dynamic> toJson() => _$OrganisationModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'representant_model.g.dart';

@JsonSerializable()
class RepresentantModel {
  const RepresentantModel({
    required this.uuid,
    required this.gender,
    required this.isCompany,
    required this.dateStart,
    required this.title,
    required this.lastname,
    required this.firstname,
    required this.fullname,
  });

  factory RepresentantModel.fromJson(Map<String, dynamic> json) => _$RepresentantModelFromJson(json);

  @JsonKey(name: 'uuid')
  final String uuid;

  @JsonKey(name: 'qualite')
  final String gender;

  @JsonKey(name: 'personne_morale')
  final bool isCompany;

  @JsonKey(name: 'date_prise_de_poste')
  final String dateStart;

  @JsonKey(name: 'titre')
  final String title;

  @JsonKey(name: 'nom')
  final String lastname;

  @JsonKey(name: 'prenom')
  final String firstname;

  @JsonKey(name: 'nom_complet')
  final String fullname;

  Map<String, dynamic> toJson() => _$RepresentantModelToJson(this);
}

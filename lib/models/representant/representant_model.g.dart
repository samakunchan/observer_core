// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'representant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepresentantModelImpl _$$RepresentantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RepresentantModelImpl(
      uuid: json['uuid'] as String,
      gender: json['qualite'] as String,
      isCompany: json['personne_morale'] as bool,
      dateStart: json['date_prise_de_poste'] as String,
      title: json['titre'] as String,
      lastname: json['nom'] as String,
      firstname: json['prenom'] as String,
      fullname: json['nom_complet'] as String,
    );

Map<String, dynamic> _$$RepresentantModelImplToJson(
        _$RepresentantModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'qualite': instance.gender,
      'personne_morale': instance.isCompany,
      'date_prise_de_poste': instance.dateStart,
      'titre': instance.title,
      'nom': instance.lastname,
      'prenom': instance.firstname,
      'nom_complet': instance.fullname,
    };

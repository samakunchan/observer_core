import 'package:freezed_annotation/freezed_annotation.dart';

part 'proposed_service_dto.freezed.dart';
part 'proposed_service_dto.g.dart';

@freezed
class ProposedServiceDTO with _$ProposedServiceDTO {
  /// ## Exemples :
  /// ### Création d'un service
  /// ```dart
  /// {
  ///   "title": "Titre du service",
  ///   "content": "Description du service",
  ///   "icon": "classe de l'icone fontawesome dans le projet angular front",
  ///   "isPublished": false,
  /// }
  /// ```
  /// ### Mise à jour du service
  /// ```dart
  /// {
  ///   "id": 1, // Requis pour la mise à jour
  ///   "title": "Titre du service",
  ///   "content": "Description du service",
  ///   "icon": "classe de l'icone fontawesome dans le projet angular front",
  ///   "isPublished": false,
  /// }
  /// ```
  const factory ProposedServiceDTO({
    required String title,
    required String content,
    required bool isPublished,
    String? icon,
    int? id,
  }) = _ProposedServiceDTO;
  factory ProposedServiceDTO.fromJson(Map<String, dynamic> json) => _$ProposedServiceDTOFromJson(json);

  static const ProposedServiceDTO firstSelected = ProposedServiceDTO(
    title: '',
    content: '',
    icon: '',
    isPublished: false,
  );
}

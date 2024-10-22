import 'package:equatable/equatable.dart';
import 'package:observer_core/enums/enums_export.dart';

/// # Récupération des données.
/// ## Récupération d'une liste
/// ```dart
/// // Input
/// GetParams(
///   accessToken: authTokenModel.accessToken,
///   endPoint: MainProject.documentsUploadEndPoint,
/// ),
/// ```
/// ```
/// // Output
/// GET http://localhost:3005/documents
/// ```
/// ## Récupération d'un résultat
/// ```dart
/// // Input
/// GetParams(
///   accessToken: authTokenModel.accessToken,
///   id: '5',
///   endPoint: MainProject.documentsUploadEndPoint,
/// ),
/// ```
/// ```
/// // Output
/// GET http://localhost:3005/documents/5
/// ```
class GetParams extends Equatable {
  /// # Récupération des données.
  /// ## Récupération d'une liste
  /// ```dart
  /// // Input
  /// GetParams(
  ///   accessToken: authTokenModel.accessToken,
  ///   endPoint: MainProject.documentsUploadEndPoint,
  /// ),
  /// ```
  /// ```
  /// // Output
  /// GET http://localhost:3005/documents
  /// ```
  /// ## Récupération d'un résultat
  /// ```dart
  /// // Input
  /// GetParams(
  ///   accessToken: authTokenModel.accessToken,
  ///   id: '5',
  ///   endPoint: MainProject.documentsUploadEndPoint,
  /// ),
  /// ```
  /// ```
  /// // Output
  /// GET http://localhost:3005/documents/5
  /// ```
  const GetParams({
    required this.accessToken,
    required this.endPoint,
    this.id,
    this.filteredBy,
  });

  final String accessToken;
  final String endPoint;
  final String? id;
  final DocumentFilteredType? filteredBy;

  @override
  List<Object> get props => [accessToken, endPoint];
}

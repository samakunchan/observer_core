import 'package:equatable/equatable.dart';

/// # 3 types de configurations :
/// ## Suppression d'un seul élément
/// #### Sans `body` et juste avec le `path`.
/// ```dart
/// // Input
/// DeleteParams(
///   accessToken: authTokenModel.accessToken,
///   body: event.id.toString(),
///   endPoint: MainProject.projectsEndPoint,
/// ),
/// ```
/// ```
/// // Output
/// DELETE http://localhost:3005/projects/6
/// ```
/// #### Avec `body` et juste sans le `path`.
/// ```dart
/// // Input
/// DeleteParams(
///   accessToken: authTokenModel.accessToken,
///   body: jsonEncode(event.environmentForDelete.toJson()),
///   endPoint: MainProject.projectsEndPoint,
/// ),
/// ```
/// ```
/// // Output
/// URL : DELETE http://localhost:3005/projects
///
/// Body :
/// {
///   'id': 6,
/// }
/// ```
/// ## Suppression de multiple éléments
/// ```dart
/// DeleteParams(
///   accessToken: authTokenModel.accessToken,
///   body: jsonEncode(
///     {
///       'categoriesIds': [event.categoryForDelete.id],
///     },
///   ),
///   endPoint: MainProject.projectsEndPoint,
/// ),
/// ```
class DeleteParams extends Equatable {
  /// # 3 types de configurations :
  /// ## Suppression d'un seul élément
  /// #### Sans `body` et juste avec le `path`.
  /// ```dart
  /// // Input
  /// DeleteParams(
  ///   accessToken: authTokenModel.accessToken,
  ///   body: event.id.toString(),
  ///   endPoint: MainProject.projectsEndPoint,
  /// ),
  /// ```
  /// ```
  /// // Output
  /// DELETE http://localhost:3005/projects/6
  /// ```
  /// #### Avec `body` et juste sans le `path`.
  /// ```dart
  /// // Input
  /// DeleteParams(
  ///   accessToken: authTokenModel.accessToken,
  ///   body: jsonEncode(event.environmentForDelete.toJson()),
  ///   endPoint: MainProject.projectsEndPoint,
  /// ),
  /// ```
  /// ```
  /// // Output
  /// URL : DELETE http://localhost:3005/projects
  ///
  /// Body :
  /// {
  ///   'id': 6,
  /// }
  /// ```
  /// ## Suppression de multiple éléments
  /// ```dart
  /// DeleteParams(
  ///   accessToken: authTokenModel.accessToken,
  ///   body: jsonEncode(
  ///     {
  ///       'categoriesIds': [event.categoryForDelete.id],
  ///     },
  ///   ),
  ///   endPoint: MainProject.projectsEndPoint,
  /// ),
  /// ```
  const DeleteParams({required this.accessToken, required this.body, required this.endPoint});

  final String accessToken;
  final String body;
  final String endPoint;

  @override
  List<Object> get props => [accessToken, body, endPoint];
}

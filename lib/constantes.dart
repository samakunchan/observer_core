import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

enum ApiUrl {
  /// Domain = http://localhost:3005
  domain(value: 'http://localhost:3005'),

  /// Endpoint = /articles
  articlesEndPoint(value: '/articles'),

  /// Endpoint = /projects
  projectsEndPoint(value: '/projects'),

  /// Endpoint = /environments
  environmentsEndPoint(value: '/environments'),

  /// Endpoint = /environments/search
  environmentsSearchEndPoint(value: '/environments/search'),

  /// Endpoint = /categories
  categoriesEndPoint(value: '/categories'),

  /// Endpoint = /organisations
  organisationsEndPoint(value: '/organisations'),

  /// Endpoint = /legals
  legalsEndPoint(value: '/legals'),

  /// Endpoint = /documents
  documentsEndPoint(value: '/documents'),

  /// Endpoint = /proposed-services
  servicesEndPoint(value: '/proposed-services'),

  /// Endpoint = /skills
  skillsEndPoint(value: '/skills'),

  /// Endpoint = /reasons
  reasonsEndPoint(value: '/reasons'),

  /// Endpoint = /abouts
  aboutmeEndPoint(value: '/abouts'),

  /// Endpoint = /documents/upload
  documentsUploadEndPoint(value: '/documents/upload'),

  /// Endpoint = /documents/multi-upload
  documentsMultiUploadEndPoint(value: 'documents/multi-upload'),

  /// Endpoint = /documents/multiple-files
  documentsMultiDeleteEndPoint(value: 'documents/multiple-files'),

  /// Content-Type = application/json
  defaultContentType(value: 'application/json'),

  /// Content-Type = multipart/form-data
  formDataContentType(value: 'multipart/form-data'),
  ;

  const ApiUrl({required this.value});

  final String value;
}

class MainProject {
  /// Value = "dashboard papangue"
  static String title = 'dashboard papangue';

  /// API Url = "http://localhost:3005"
  static const String apiUrl = 'http://localhost:3005';

  /// Endpoint = /articles
  static const String articlesEndPoint = '/articles';

  /// Endpoint = /projects
  static const String projectsEndPoint = '/projects';

  /// Endpoint = /environments
  static const String environmentsEndPoint = '/environments';

  /// Endpoint = /environments/search
  static const String environmentsSearchEndPoint = '/environments/search';

  /// Endpoint = /categories
  static const String categoriesEndPoint = '/categories';

  /// Endpoint = /organisations
  static const String organisationsEndPoint = '/organisations';

  /// Endpoint = /legals
  static const String legalsEndPoint = '/legals';

  /// Endpoint = /documents
  static const String documentsEndPoint = '/documents';

  /// Endpoint = /proposed-services
  static const String services = '/proposed-services';

  /// Endpoint = /skills
  static const String skills = '/skills';

  /// Endpoint = /reasons
  static const String reasons = '/reasons';

  /// Endpoint = /abouts
  static const String aboutme = '/abouts';

  /// Endpoint = '/documents/upload'
  static const String documentsUploadEndPoint = '/documents/upload';

  /// Endpoint = '/documents/multi-upload'
  static const String documentsMultiUploadEndPoint = '/documents/multi-upload';

  /// Endpoint = '/documents/multi-upload'
  static const String documentsMultiDeleteEndPoint = '/documents/multiple-files';

  /// Name = [application/json]
  static String defaultContentType = 'application/json';

  static String formDataContentType = 'multipart/form-data';
}

class ErrorMessage {
  /// Value: "Veuillez créer votre message d‘érreur."
  static const String noErrorMessageHandled = 'Veuillez créer votre message d‘érreur.';

  /// Value : "La connexion internet a été perdu."
  static const String networkOfflineMessage = 'La connexion internet a été perdu.';

  /// Value: "Le serveur ne réponds plus."
  static const String serverFailureMessage = 'Le serveur ne réponds plus.';

  /// Value: "Le cache a un problème."
  static const String cacheFailureMessage = 'Le cache a un problème.';

  /// Value: "La route est introuvable."
  static const String notFoundMessage = 'La route est introuvable.';

  /// Value: "Cette ressource requiert une authentification."
  static const String unAuthorizationMessage = 'Cette ressource requiert une authentification.';

  /// Value: "Cette ressource requiert des droits que vous n‘avez pas."
  static const String forbiddenMessage = 'Cette ressource requiert des droits que vous n‘avez pas.';
}

class KWidget {
  static Widget toogleSidebar(BuildContext context) {
    return MacosIconButton(
      mouseCursor: SystemMouseCursors.click,
      icon: MacosIcon(
        CupertinoIcons.sidebar_left,
        color: MacosTheme.brightnessOf(context).resolve(
          const Color.fromRGBO(0, 0, 0, 0.5),
          const Color.fromRGBO(255, 255, 255, 0.5),
        ),
        size: 20,
      ),
      boxConstraints: const BoxConstraints(
        minHeight: 20,
        minWidth: 20,
        maxWidth: 48,
        maxHeight: 38,
      ),
      onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
    );
  }

  static Widget alloBossIHaveAProblem(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MacosIcon(
              CupertinoIcons.lock,
              color: CupertinoColors.link,
              size: 80,
            ),
            Text(message),
          ],
        ),
      ],
    );
  }
}

const Color kBeginlayerColor = CupertinoColors.white;
const Color klayerColor = CupertinoColors.systemGrey3;

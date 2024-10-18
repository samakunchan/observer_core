import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

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

class MenuText {
  /// Value = "environnements"
  static String environments = 'environnements';

  /// Value = "categories"
  static String categories = 'categories';

  /// Value = "projets"
  static String projects = 'projets';

  /// Value = "articles"
  static String articles = 'articles';

  /// Value = "organisation"
  static String organisation = 'organisation';

  /// Value = "juridiques"
  static String legals = 'juridiques';

  /// Value = "documents"
  static String documents = 'documents';

  /// Value = "images"
  static String images = 'images';

  /// Value = "PDF"
  static String pdf = 'PDF';

  /// Value = "paramètres"
  static String settings = 'paramètres';

  /// Value = "authentification"
  static String auth = 'authentification';

  /// Value = "Services"
  static String services = 'Services';

  /// Value = "Technos"
  static String skills = 'Technos';

  /// Value = "Arguments"
  static String reasons = 'Arguments';

  /// Value = "A propos de moi"
  static String aboutme = 'A propos de moi';
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
        color: MacosTheme.brightnessOf(context).resolve(const Color.fromRGBO(0, 0, 0, 0.5), const Color.fromRGBO(255, 255, 255, 0.5)),
        size: 20,
      ),
      boxConstraints: const BoxConstraints(minHeight: 20, minWidth: 20, maxWidth: 48, maxHeight: 38),
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
            const MacosIcon(CupertinoIcons.lock, color: CupertinoColors.link, size: 80),
            Text(message),
          ],
        ),
      ],
    );
  }
}

const Color kBeginlayerColor = CupertinoColors.white;
const Color klayerColor = CupertinoColors.systemGrey3;

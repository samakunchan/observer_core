import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mime/mime.dart';
import 'package:observer_core/dtos/dtos_export.dart';

/// Permet d'afficher 2, 3 ou 4 grid card pour les articles et projets.
int getCountAxis({required double sizeContentArea}) {
  switch (sizeContentArea) {
    case > 1600:
      return 4;
    case > 1000:
      return 3;
    default:
      return 2;
  }
}

// Espace entre chaque grid card pour les articles et projets.
double getAspectRatio({required double sizeContentArea}) {
  switch (sizeContentArea) {
    case > 1200:
      return 1.2;
    default:
      return 1;
  }
}

/// ## Exemple
/// ### Input
/// ```dart
/// 2024-09-29T00:00:00.000Z
/// ```
/// ### Output
/// ```dart
/// 29 septembre 2024
/// ```
/// Pour les majuscules, il faudra utiliser l'extension `.capitalize()`.
String formatDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat format = DateFormat.yMMMMd('fr_FR');
  return format.format(dateTime);
}

/// ## Exemple
/// ### Input
/// ```dart
/// 2024-09-29T00:00:00.000Z
/// ```
/// ### Output
/// ```dart
/// dimanche 29 septembre 2024
/// ```
/// Pour les majuscules, il faudra utiliser l'extension `.capitalize()`.
String formatFullDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat format = DateFormat.yMMMMEEEEd('fr_FR');
  return format.format(dateTime);
}

/// ## Exemple
/// ### Input
/// ```dart
/// 2024-09-29T00:00:00.000Z
/// ```
/// ### Output
/// ```dart
/// {
///   "dateTime": DateTime.now() // ou DateTime.parse(date),
///   "dateFormated": "2024-09-29",
/// }
/// ```
DateDTO formatCommonDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat format = DateFormat.yMd('fr_FR');
  return DateDTO(dateTime: dateTime, dateFormated: format.format(dateTime));
}

/// ## Exemple
/// ### Input
/// ```dart
/// 2024-09-29T00:00:00.000Z
/// ```
/// ### Output
/// ```dart
/// 29/09/2024
/// ```
/// Pour les majuscules, il faudra utiliser l'extension `.capitalize()`.
String unFormatFullDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat format = DateFormat.yMd('fr_FR');
  return format.format(dateTime);
}

/// Exemple:
/// - logger.log()
/// - logger.e(<span style="color: red">"Cele sera comme ça"</span>) <span style="color: red">[Level.error]</span>
/// - logger.w(<span style="color: orange">"Cele sera comme ça"</span>) <span style="color: orange">[Level.warning]</span>
/// - logger.t(<span style="color: gray">"Cele sera comme ça"</span>) <span style="color: gray">[Level.trace]</span>
/// - logger.d(<span style="color: white">"Cele sera comme ça"</span>) <span style="color: white">[Level.debug]</span>
/// - logger.i(<span style="color: #4bb3d5">"Cele sera comme ça"</span>) <span style="color: #4bb3d5">[Level.info]</span>
/// - logger.f(<span style="color: fuchsia">"Cele sera comme ça"</span>) <span style="color: fuchsia">[Level.fatal]</span>
Logger logger = Logger(
  printer: PrettyPrinter(
    noBoxingByDefault: true, // Pour afficher les lignes du tableau
    methodCount: 0, // Pour afficher la Stack Trace
    // printTime: true,
  ),
);

/// ## Exemple :
/// ### Input
/// ```dart
/// final String? mimetype = getMimeType('image.png');
/// ```
/// ### Output
/// ```dart
/// image/png
/// ```
String? getMimeType({required String file}) {
  return lookupMimeType(file);
}

/// ## Exemple :
/// ### Input
/// ```dart
/// final File file = File('/path/to/image.png');
/// final FormData formData = await getFormDataOneFile(file);
/// ```
/// ### Output
/// ```dart
/// FormData();
/// ```
// Future<FormData> getFormDataOneFile({required File file}) async {
//   return FormData.fromMap({
//     'file': MultipartFile.fromFile(
//       file.path,
//       filename: file.path.split('/').last,
//       contentType: MediaType.parse(lookupMimeType(file.path) ?? 'application/octet-stream'),
//     ),
//   });
// }

/// ## Exemple :
/// ### Input
/// ```dart
/// final String path = '/path/to/image.png';
/// final FormData formData = await getFormDataMultipleFile(files: [path]);
/// ```
/// ### Output
/// ```dart
/// FormData();
/// ```
Future<FormData> getFormDataMultipleFile({required List<String> files}) async {
  final FormData formData = FormData();
  for (final String file in files) {
    final mimeType = getMimeType(file: file) ?? 'application/octet-stream';

    formData.files.addAll([
      MapEntry(
        'files',
        await MultipartFile.fromFile(
          file,
          filename: file.split('/').last,
          contentType: MediaType.parse(mimeType),
        ),
      ),
    ]);
  }

  return formData;
}

import 'package:intl/intl.dart';

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

double getAspectRatio({required double sizeContentArea}) {
  switch (sizeContentArea) {
    case > 1200:
      return 1.2;
    default:
      return 1;
  }
}

/// Format les dates afin d'éviter de l'installer partout.
String formatDate(String date) {
  final dateTime = DateTime.parse(date);
  final format = DateFormat.yMMMMd('fr_FR');
  final DateTime dateTime = DateTime.parse(date);
  return format.format(dateTime);
}

String formatFullDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat format = DateFormat.yMMMMEEEEd('fr_FR');
  return format.format(dateTime);
}

DateDTO formatCommonDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat format = DateFormat.yMd('fr_FR');
  return DateDTO(dateTime: dateTime, dateFormated: format.format(dateTime));
}

/// Exemple:
/// - logger.log()
/// - logger.e(<span style="color: red">"Cele sera comme ça"</span>) <span style="color: red">[Level.error]</span>
/// - logger.w(<span style="color: orange">"Cele sera comme ça"</span>) <span style="color: orange">[Level.warning]</span>
/// - logger.t(<span style="color: gray">"Cele sera comme ça"</span>) <span style="color: gray">[Level.trace]</span>
/// - logger.d(<span style="color: white">"Cele sera comme ça"</span>) <span style="color: white">[Level.debug]</span>
/// - logger.i(<span style="color: #4bb3d5">"Cele sera comme ça"</span>) <span style="color: #4bb3d5">[Level.info]</span>
/// - logger.f(<span style="color: fuchsia">"Cele sera comme ça"</span>) <span style="color: fuchsia">[Level.fatal]</span>
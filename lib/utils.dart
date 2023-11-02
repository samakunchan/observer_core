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

String formatDate(String date) {
  final dateTime = DateTime.parse(date);
  final format = DateFormat.yMMMMd('fr_FR');
  return format.format(dateTime);
}

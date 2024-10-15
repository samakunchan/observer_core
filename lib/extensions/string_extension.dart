import 'package:observer_core/extensions/ansible_color.dart';

extension StringExtension on String {
  /// Permet de mettre la 1ère lettre en majuscule
  /// ```dart
  /// String text = "hello world";
  /// print(text.ucFirst());
  /// // "Hello world"
  /// ```
  String ucFirst() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Permet de mettre la 1ère lettre en majuscule
  /// ```dart
  /// String text = "jeudi 12 septembre 2024";
  /// print(text.capitalize());
  /// // "Jeudi 12 Septembre 2024"
  /// ```
  String capitalize() {
    return split(' ').map((String text) => text.ucFirst()).toList().join(' ');
  }

  /// Permet de transformer le texte du mimetype en quelque chose de plus lisible
  /// ```dart
  /// String text = "image/jpeg";
  /// print(text.formatMimetype());
  /// // "Image JPEG"
  /// ```
  String formatMimetype() {
    final List<String> textSeparated = split('/').map((String text) => text.ucFirst()).toList();
    final String firstPart = textSeparated.first.ucFirst();
    final String lastPart = textSeparated.last.toUpperCase();
    return [firstPart, lastPart].join(' ');
  }

  /// Permet de colorer du text dans la console
  /// ```dart
  /// String text = "Hello world";
  /// print(text.colorTo());
  /// // "Hello world" (couleur par défaut)
  /// //
  /// print("Hello world".colorTo(color: AnsiColor.red));
  /// // "Hello world" (couleur rouge)
  /// ```
  String colorTo({String color = AnsiColor.blue}) {
    return _getText(color, this);
  }

  /// Permet de concatener le texte et la couleur
  /// ```dart
  /// Ex: AnsiColor.getText(color, this);
  /// // "Mon texte en couleur"
  /// ```
  static String _getText(String color, String text) {
    return '\x1B$color$text\x1B[0m';
  }
}

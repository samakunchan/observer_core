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

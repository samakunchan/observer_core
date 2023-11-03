import 'dart:convert';

import 'package:observer_core/extensions/ansible_color.dart';
import 'package:observer_core/extensions/string_extension.dart';

extension MapExtension on Map<String, dynamic> {
  /// Permet de debugger les JSON dans la console
  /// ```dart
  /// Map<String, dynamic> json = {'test': true, 'object': {'obj1': 'hello world'}, 'array': [1, 2, 3] };
  /// print(json.debugJson());
  /// print(json.debugJson(color: AnsiColor.blue));
  /// // {
  /// //    "test": true,
  /// //    "object": {
  /// //        "obj1": "hello world"
  /// //    },
  /// //    "array": [
  /// //        1,
  /// //        2,
  /// //        3
  /// //    ]
  /// // }
  /// ```
  String debugJson<T>({String color = AnsiColor.blue}) {
    const JsonEncoder encoder = JsonEncoder.withIndent('    ');
    final String input = StackTrace.current.toString();
    const String startWord = 'MapExtension.debugJson';
    const String endWord = '    ';
    final startIndex = input.indexOf(startWord);
    final endIndex = input.indexOf(endWord, startIndex + startWord.length);

    final String path = input.substring(startIndex + startWord.length, endIndex);
    final String text = 'Debugage du JSON ($T):'.colorTo();

    return '$text$path\n${encoder.convert(this).colorTo(color: color)}';
  }

  String showJson() {
    const JsonEncoder encoder = JsonEncoder.withIndent('    ');

    return encoder.convert(this);
  }

  /// Transforme un JSON mal mapper par dart en JSON complet
  /// ```dart
  /// final Map<String, dynamic> myJson = myObject.toJson(); // Ne tranforme pas completement tout en JSON
  /// final Map<String, dynamic> completeJson = myJson.deep();
  /// ```
  Map<String, dynamic> deep() {
    return jsonDecode(jsonEncode(this)) as Map<String, dynamic>;
  }
}

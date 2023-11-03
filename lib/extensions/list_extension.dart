import 'dart:convert';

import 'package:observer_core/extensions/map_extension.dart';
import 'package:observer_core/extensions/string_extension.dart';

extension ListExtension on List<Map<String, dynamic>> {
  String debugArrayJson<T>() {
    final String input = StackTrace.current.toString();
    const String startWord = 'ListExtension.debugArrayJson';
    const String endWord = '  ';
    final startIndex = input.indexOf(startWord);
    final endIndex = input.indexOf(endWord, startIndex + startWord.length);

    final String path = input.substring(startIndex + startWord.length, endIndex);

    final String text = 'Debugage de la liste ($T):'.colorTo();

    return '$text$path\n${map((e) => (jsonDecode(jsonEncode(e)) as Map<String, dynamic>).showJson()).toList()}';
  }
}

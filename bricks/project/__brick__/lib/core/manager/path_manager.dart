// Dart imports:
import 'dart:io';

// Package imports:
import 'package:path_provider/path_provider.dart';

class PathManager {
  static Future<String> get _localPath async =>
      (await getApplicationDocumentsDirectory()).path;

  static Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  static Future<File> writeByte(String fileName, List<int> bytes) async =>
      ((await _localFile(fileName)).writeAsBytes(bytes));

  static Future<List<int>?> readByte(String fileName) async {
    return await (await _localFile(fileName)).readAsBytes();
  }
}

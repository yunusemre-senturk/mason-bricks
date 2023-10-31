// Dart imports:
import 'dart:io';
import 'dart:typed_data';

// Package imports:
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:{{projectName.snakeCase()}}/core/util/logger.dart';

class LocalPathManager {
  static LocalPathManager? _instance;
  static LocalPathManager get instance {
    return _instance ??= LocalPathManager();
  }

  Future<void> deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }

  Future<void> deleteAppDir() async {
    final appDir = await getApplicationSupportDirectory();

    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }
  }

  Future<void> deletePath() async {
    final appDir = await getApplicationDocumentsDirectory();
    appDir.listSync().forEach((element) {
      Log.i(element.path);
    });
    final appDir2 = Directory("${appDir.path}/Trimmer");
    Log.i(appDir2.path);
    if (appDir2.existsSync()) {
      appDir2.deleteSync(recursive: true);
    }
  }

  Future<File> writeFile(Uint8List data, String name) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = '$tempPath/$name';
    var bytes = ByteData.view(data.buffer);
    final buffer = bytes.buffer;
    return File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}

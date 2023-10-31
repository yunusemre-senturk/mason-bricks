import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class ImageCompres {
  ImageCompres._();
  // // compress image
  // static Future<List<int>?> compressImage(File file) async {
  //   var result = await FlutterImageCompress.compressWithFile(
  //     file.absolute.path,
  //     quality: 50,
  //   );
  //   return result;
  // }

  static Future<File?> writeFile(Uint8List data, String name) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final filePath = '$tempPath/$name';
    final bytes = ByteData.view(data.buffer);
    final buffer = bytes.buffer;
    return File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  // image compress
  static Future<File?> compressImageFile(File file) async {
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 50,
    );
    return await writeFile(result!, file.path.split('/').last);
  }

  // liste olarak gelen fileları sıkıştırır
  static Future<List<File>?> compressImageFiles(List<File> files) async {
    List<File>? items = [];
    for (var file in files) {
      var a = await compressImageFile(file);
      if (a != null) {
        items.add(a);
      }
    }
    return items;
  }
}

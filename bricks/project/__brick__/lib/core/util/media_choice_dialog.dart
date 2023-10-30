import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:{{projectName.snakeCase()}}/core/util/image_compres.dart';
import 'package:{{projectName.snakeCase()}}/core/widget/loading_dialog.dart';

extension BuildContextEx on BuildContext {
  Future<List<File>?> mediaChoiceDialog({int? selectableItemCount}) {
    return showModalBottomSheet<List<File>?>(
        context: this,
        builder: (c) => ListView(
              shrinkWrap: true,
              children: [
                if (selectableItemCount != null)
                  ListTile(
                    title: Text(
                        "En fazla $selectableItemCount seçim yapabilirsiniz."),
                  ),
                ListTile(
                  onTap: () {
                    // var loading = LoadingDialog.show(this);
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        // .whenComplete(() => loading.close())
                        .then((value) {
                      if (value != null) {
                        var loading = LoadingDialog.show(this);
                        ImageCompres.compressImageFile(File(value.path))
                            .whenComplete(() => loading.close())
                            .then((value) {
                          if (value != null) {
                            Navigator.pop(c, [File(value.path)]);
                          }
                        });
                      } else {
                        Navigator.pop(c);
                      }
                      return value;
                    });
                  },
                  title: const Text("Kamera"),
                  leading: const Icon(Icons.photo_camera),
                ),
                ListTile(
                  onTap: () {
                    ImagePicker().pickMultiImage().then((value) async {
                      if (value.isNotEmpty) {
                        if (selectableItemCount != null) {
                          value = value.take(selectableItemCount).toList();
                        }
                        var loading = LoadingDialog.show(this);

                        List<File>? items =
                            await ImageCompres.compressImageFiles(
                                    value.map((e) => File(e.path)).toList())
                                .whenComplete(() => loading.close());
                        loading.close();
                        Navigator.pop(this, items);
                      } else {
                        Navigator.pop(this);
                      }
                      return value;
                    });
                  },
                  title: const Text("Galeri"),
                  leading: const Icon(Icons.photo_library),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(this);
                  },
                  title: const Text("İptal"),
                  leading: const Icon(Icons.close),
                )
              ],
            ));
  }
}

import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FileStorageManager {
  static const images = "images";
  static const titleImage = "titleImage";

  final _storage = FirebaseStorage.instance.ref();

  Future<List<String>> uploadPlatformFiles(
    List<PlatformFile> files, {
    required String path,
  }) async {
    final addedUrls = <String>[];
    try {
      for (var file in files) {
        if (file.bytes != null && file.name != null) {
          final uploaded =
              await _storage.child(path + file.name!).putData(file.bytes!);
          addedUrls.add(await uploaded.ref.getDownloadURL());
        }
      }
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return addedUrls;
  }

  Future<String?> uploadPlatformFile(
    PlatformFile file, {
    required String path,
  }) async {
    try {
      if (file.bytes != null && file.name != null) {
        final uploaded =
            await _storage.child(path + file.name!).putData(file.bytes!);
        return uploaded.ref.getDownloadURL();
      }
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}

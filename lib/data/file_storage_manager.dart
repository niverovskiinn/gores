import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FileStorageManager {
  static const images = "images";
  static const titleImage = "titleImage";

  final _storage = FirebaseStorage.instance.ref();

  Future<List<PlatformFile>> uploadPlatformFiles(
    List<PlatformFile> files, {
    required String path,
  }) async {
  
    final addedFiles = <PlatformFile>[];
    try {
      files.forEach(
        (file) async {
          if (file.bytes != null && file.name != null) {
            await _storage.child(path + file.name!).putData(file.bytes!);
            addedFiles.add(file);
          }
        },
      );
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return addedFiles;
  }

  Future<PlatformFile?> uploadPlatformFile(
    PlatformFile file, {
    required String path,
  }) async {
    try {
      if (file.bytes != null && file.name != null) {
        await _storage.child(path + file.name!).putData(file.bytes!);
        return file;
      }
    } on FirebaseException catch (e) {
      log(e.toString());
    }
  }
}

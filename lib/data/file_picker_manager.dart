import 'package:file_picker/file_picker.dart';

class FilePickerManager {
  final _filePicker = FilePicker.platform;

  Future<PlatformFile?> singleImage() async {
    final result = await _filePicker.pickFiles(type: FileType.image);
    if (result != null) {
      return result.files.single;
    }
  }

  Future<List<PlatformFile>> multipleImages() async {
    final result =
        await _filePicker.pickFiles(type: FileType.image, allowMultiple: true);
    return result != null ? result.files : [];
  }
}

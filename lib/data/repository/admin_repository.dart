import 'package:gores/data/database.dart';
import 'package:gores/data/file_picker_manager.dart';
import 'package:gores/data/file_storage_manager.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/auth_repository.dart';

class AdminRepository {
  final _db = Database.instance;
  final AuthRepository _authRepository;

  final FilePickerManager _filePicker;
  final FileStorageManager _fileStorage;

  AdminRepository(this._authRepository, this._fileStorage, this._filePicker);

  Future<Stream<List<Restaurant?>>> getRestaurants() async {
    if (_authRepository.isLoggedIn())
      return await _db.getAdminRestaurants(_authRepository.currentUser!.uid);
    return Stream.empty();
  }

  Future<String?> pickTitleImage(String restId) async {
    final file = await _filePicker.singleImage();
    if (file != null) {
      final path =
          "${FileStorageManager.images}/$restId/${FileStorageManager.titleImage}/";

      final res = await _fileStorage.uploadPlatformFile(file, path: path);
      return res != null ? path + file.name! : null;
    }
  }

  Future<List<String?>> pickImages(String restId) async {
    final files = await _filePicker.multipleImages();
    final path = "${FileStorageManager.images}/$restId/";
    final res = await _fileStorage.uploadPlatformFiles(files, path: path);
    return files.map((e) => e.name != null ? (path + e.name!) : null).toList();
  }
}

import 'package:uuid/uuid.dart';

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

  Future<void> addRestaurant(Restaurant restaurant) async {
    // look transactions
    //https://firebase.flutter.dev/docs/firestore/usage#transactions
    if (_authRepository.isLoggedIn()) {
      await _db.addRestaurant(restaurant);
      final rests = await (await getRestaurants()).first;
      final res = <String>[];
      rests.forEach((r) {
        if (r != null && r.id != null) {
          res.add(r.id!);
        }
      });
      await _db.updateAdminRestaurants(_authRepository.currentUser!.uid, res);
    }
  }

  Future<void> rRestaurant(Restaurant restaurant) async {
    await _db.addRestaurant(restaurant);
  }

  Future<void> updateRestaurant(String id, Restaurant restaurant) async {}

  Future<String?> pickTitleImage(String restId) async {
    final file = await _filePicker.singleImage();
    if (file != null) {
      final path =
          "${FileStorageManager.images}/$restId/${FileStorageManager.titleImage}/";
      return await _fileStorage.uploadPlatformFile(file, path: path);
    }
  }

  Future<List<String>> pickImages(String restId) async {
    final files = await _filePicker.multipleImages();
    final path = "${FileStorageManager.images}/$restId/";
    final urls = await _fileStorage.uploadPlatformFiles(files, path: path);
    return urls;
  }
}

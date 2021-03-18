import 'package:either_dart/either.dart';
import 'package:get/utils.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/default_error.dart';

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

  Future<Either<DefaultError, Stream<List<Restaurant?>>>>
      getRestaurants() async {
    try {
      if (_authRepository.isLoggedIn())
        return Right(
            await _db.getAdminRestaurants(_authRepository.currentUser!.uid));
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(DefaultError(message: unauthorized.tr));
  }

  Future<Either<DefaultError, void>> addRestaurant(
      Restaurant restaurant) async {
    try {
      if (_authRepository.isLoggedIn() && restaurant.id != null) {
        return Right(await _db.addRestaurant(
            _authRepository.currentUser!.uid, restaurant));
      }
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(
        DefaultError(message: unauthorized.tr + ' || restaurant.id == null'));
  }

  Future<Either<DefaultError, void>> updateRestaurant(
      String id, Restaurant restaurant) async {
    try {
      if (_authRepository.isLoggedIn()) {
        return Right(await _db.updateRestaurant(id, restaurant));
      }
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(DefaultError(message: unauthorized.tr));
  }

  Future<Either<DefaultError, String?>> pickTitleImage(String restId) async {
    try {
      final file = await _filePicker.singleImage();
      if (file != null) {
        final path =
            "${FileStorageManager.images}/$restId/${FileStorageManager.titleImage}/";
        return Right(await _fileStorage.uploadPlatformFile(file, path: path));
      }
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
    return Left(DefaultError(message: badFile.tr));
  }

  Future<Either<DefaultError, List<String>>> pickImages(String restId) async {
    try {
      final files = await _filePicker.multipleImages();
      final path = "${FileStorageManager.images}/$restId/";
      final urls = await _fileStorage.uploadPlatformFiles(files, path: path);
      return Right(urls);
    } catch (e) {
      return Left(DefaultError(message: e.toString()));
    }
  }
}

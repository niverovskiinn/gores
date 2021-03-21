import 'package:get/get.dart';
import 'package:gores/controllers/admin_home_controller.dart';
import 'package:gores/controllers/new_restaurant_controller.dart';
import 'package:gores/data/file_picker_manager.dart';
import 'package:gores/data/file_storage_manager.dart';
import 'package:gores/data/repository/admin_repository.dart';
import 'package:gores/data/repository/auth_repository.dart';
import 'package:gores/controllers/home_controller.dart';
import 'package:gores/controllers/login_controller.dart';
import 'package:gores/controllers/profile_controller.dart';
import 'package:gores/controllers/signup_controller.dart';
import 'package:gores/data/database.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/dependency_management.md
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<FilePickerManager>(() => FilePickerManager());
    Get.lazyPut<FileStorageManager>(() => FileStorageManager());
    Get.lazyPut<AdminRepository>(() => AdminRepository(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<LoginController>(
        () => LoginController(authRepository: Get.find()));
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SignUpController>(
        () => SignUpController(authRepository: Get.find()));
    Get.lazyPut<AdminHomeController>(
        () => AdminHomeController(Get.find(), Get.find()));
  }
}

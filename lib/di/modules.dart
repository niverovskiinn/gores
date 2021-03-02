import 'package:get/get.dart';
import 'package:gores/controllers/auth_controller.dart';
import 'package:gores/controllers/profile_controller.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/dependency_management.md
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}

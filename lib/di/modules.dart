import 'package:get/get.dart';
import 'package:gores/base/lang/translation_service.dart';
import 'package:gores/controllers/auth_controller.dart';
import 'package:gores/controllers/login_controller.dart';
import 'package:gores/controllers/profile_controller.dart';
import 'package:gores/controllers/signup_controller.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/dependency_management.md
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<LoginController>(
        () => LoginController(authController: Get.find()));
    Get.lazyPut<SignUpController>(
        () => SignUpController(authController: Get.find()));
  }
}

import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/auth_controller.dart';
import 'package:gores/utils/snackbars.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  final AuthController authController;
  LoginController({
    @required this.authController,
  }) : assert(authController != null);

  final _email = ''.obs;
  set email(String value) => this._email.value = value;
  String get email => this._email.value;

  final _password = ''.obs;
  set password(String value) => this._password.value = value;
  String get password => this._password.value;

  Future<bool> next() async {
    if (_validate()) {
      return await authController.login(email, password);
    }
    return false;
  }

  bool _validate() {
    if (email.isEmpty || password.isEmpty) {
      snackbarError(error.tr, emptyEmailPassword.tr);
      return false;
    }
    if (!email.isEmail) {
      snackbarError(error.tr, badEmail.tr);
      return false;
    }

    return true;
  }
}

import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/auth_controller.dart';
import 'package:gores/utils/snackbars.dart';
import 'package:meta/meta.dart';

class SignUpController extends GetxController {
  final AuthController authController;
  SignUpController({@required this.authController})
      : assert(authController != null);

  final _email = ''.obs;
  set email(String value) => this._email.value = value;
  String get email => this._email.value;

  final _phone = ''.obs;
  set phone(String value) => this._phone.value = value;
  String get phone => this._phone.value;

  final _password = ''.obs;
  set password(String value) => this._password.value = value;
  String get password => this._password.value;

  final _name = ''.obs;
  set name(String value) => this._name.value = value;
  String get name => this._name.value;

  final _confPassword = ''.obs;
  set confPassword(String value) => this._confPassword.value = value;
  String get confPassword => this._confPassword.value;

  void signUp() {
    if (_validate()) {
      authController.createUser(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
    }
  }

  bool _validate() {
    if (name.isEmpty) {
      snackbarError(error.tr, emptyName.tr);
      return false;
    }
    if (email.isEmpty || !email.isEmail) {
      snackbarError(error.tr, badEmail.tr);
      return false;
    }
    if (!_validatePassword(password)) {
      snackbarError(error.tr, badPassword.tr);
      return false;
    }
    if (password != confPassword) {
      snackbarError(error.tr, confPassNotEqualPass.tr);
      return false;
    }

    return true;
  }

  bool _validatePassword(String password, [int minLength = 8]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits & hasUppercase & hasLowercase & hasMinLength;
  }
}

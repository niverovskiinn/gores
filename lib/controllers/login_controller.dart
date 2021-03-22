import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/data/repository/auth_repository.dart';
import 'package:gores/utils/snackbars.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  LoginController({
    required this.authRepository,
  });

  final _email = ''.obs;
  set email(String? value) => this._email.value = value;
  String? get email => this._email.value;

  final _password = ''.obs;
  set password(String? value) => this._password.value = value;
  String? get password => this._password.value;

  Future<void> next() async {
    if (_validate()) {
      final res = await authRepository.login(email!, password!);
      if (res) {
        Get.offAllNamed(kIsWeb ? Routes.adminHome : Routes.home);
      } else {
        snackbarError(errorStr.tr, unknownError.tr);
      }
    }
  }

  bool _validate() {
    if (email!.isEmpty || password!.isEmpty) {
      snackbarError(errorStr.tr, emptyEmailPassword.tr);
      return false;
    }
    if (!email!.isEmail) {
      snackbarError(errorStr.tr, badEmail.tr);
      return false;
    }

    return true;
  }
}

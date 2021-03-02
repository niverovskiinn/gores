import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/profile_controller.dart';
import 'package:gores/data/database.dart';
import 'package:gores/data/models/profile.dart';
import 'package:gores/utils/snackbars.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _user = Rx<User>();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void createUser(
      {String email, String password, String name, String phone}) async {
    try {
      final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final profile = Profile(
        id: userCred.user.uid,
        name: name,
        phone: phone,
        email: email,
      );
      await Database.instance.createProfile(profile);
      Get.find<ProfileController>().profile = profile;
    } catch (e) {
      snackbarError(error.tr, e.message);
    }
  }

  void login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      snackbarError(error.tr, e.message);
    }
  }

  void logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      snackbarError(error.tr, e.message);
    }
  }
}

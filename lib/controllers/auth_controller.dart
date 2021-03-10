import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/profile_controller.dart';
import 'package:gores/data/database.dart';
import 'package:gores/data/models/profile.dart';
import 'package:gores/utils/snackbars.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createUser(
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
      return true;
    } catch (e) {
      snackbarError(error.tr, e.message);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      _proccessException(e);
      return false;
    }
  }

  void _proccessException(FirebaseAuthException ex) {
    switch (ex.code) {
      case 'invalid-email':
        snackbarError(error.tr, badEmail.tr);
        break;
      case 'user-disabled':
        snackbarError(error.tr, userDisabled.tr);
        break;
      case 'weak-password':
        snackbarError(error.tr, badPassword.tr);
        break;
      case 'email-already-in-use':
        snackbarError(error.tr, emailInUse.tr);
        break;
      case 'operation-not-allowed':
        snackbarError(error.tr, operarionNotAllowed.tr);
        break;
      case 'user-not-found':
        snackbarError(error.tr, userNotFound.tr);
        break;
      default:
        log(ex.code);
        snackbarError(error.tr, ex.message);
    }
  }

  void logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      snackbarError(error.tr, e.message);
    }
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}

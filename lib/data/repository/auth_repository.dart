import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/controllers/profile_controller.dart';
import 'package:gores/data/database.dart';
import 'package:gores/data/models/profile.dart';
import 'package:gores/data/models/roles.dart';
import 'package:gores/utils/snackbars.dart';

class AuthRepository {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createUser(
    String email,
    String password,
    String? name,
    String? phone,
    Roles role,
  ) async {
    try {
      final userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final profile = Profile(
        id: userCred.user!.uid,
        name: name,
        phone: phone,
        email: email,
        role: role,
      );
      await Database.instance.createProfile(profile);
      if (userCred.user != null) {
        final profile = await Database.instance.getProfile(userCred.user!.uid);
        if (profile != null &&
            (!kIsWeb && profile.role == Roles.admin ||
                kIsWeb && profile.role == Roles.user)) {
          logout();
          return false;
        }
        Get.find<ProfileController>().profile = profile;
        return true;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      snackbarError(errorStr.tr, e.message ?? unknownError.tr);
      return false;
    } catch (e) {
      snackbarError(errorStr.tr, unknownError.tr);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final userCred = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCred.user != null) {
        final profile = await Database.instance.getProfile(userCred.user!.uid);
        if (profile != null &&
            (!kIsWeb && profile.role == Roles.admin ||
                kIsWeb && profile.role == Roles.user)) {
          logout();
          return false;
        }
        Get.find<ProfileController>().profile = profile;
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      _proccessException(e);
      return false;
    } catch (e) {
      snackbarError(errorStr.tr, unknownError.tr);
      return false;
    }
  }

  void _proccessException(FirebaseAuthException ex) {
    log(ex.code);

    switch (ex.code) {
      case 'invalid-email':
        snackbarError(errorStr.tr, badEmail.tr);
        break;
      case 'user-disabled':
        snackbarError(errorStr.tr, userDisabled.tr);
        break;
      case 'weak-password':
        snackbarError(errorStr.tr, badPassword.tr);
        break;
      case 'email-already-in-use':
        snackbarError(errorStr.tr, emailInUse.tr);
        break;
      case 'operation-not-allowed':
        snackbarError(errorStr.tr, operarionNotAllowed.tr);
        break;
      case 'user-not-found':
        snackbarError(errorStr.tr, userNotFound.tr);
        break;
      case 'wrong-password':
        snackbarError(errorStr.tr, userNotFound.tr);
        break;
      default:
        log(ex.code);
        snackbarError(errorStr.tr, ex.message ?? unknownError.tr);
    }
  }

  void logout() async {
    try {
      await _firebaseAuth.signOut();
      Get.offAllNamed(Routes.login);
    } on FirebaseAuthException catch (e) {
      snackbarError(errorStr.tr, e.message ?? unknownError.tr);
    } catch (e) {
      snackbarError(errorStr.tr, unknownError.tr);
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}

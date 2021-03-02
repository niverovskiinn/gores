import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void snackbarError(String title, String message) {
  Get.rawSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.green[300],
  );
}

void snackbarInfo(String title, String message) {
  Get.rawSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.blue[200],
  );
}

void snackbarWarning(String title, String message) {
  Get.rawSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.yellow[300],
  );
}

void snackbarSuccess(String title, String message) {
  Get.rawSnackbar(
    title: title,
    message: message,
    backgroundColor: Colors.red[300],
  );
}

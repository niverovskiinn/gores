import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void snackbarSuccess(String title, String message) {
  _showBottomFlash(title, message, Colors.green[300]!);
}

void snackbarInfo(String title, String message) {
  _showBottomFlash(title, message, Colors.blue[200]!);
}

void snackbarWarning(String title, String message) {
  _showBottomFlash(title, message, Colors.yellow[300]!);
}

void snackbarError(String title, String message) {
  _showBottomFlash(title, message, Colors.red[300]!);
}

void _showBottomFlash(String title, String message, Color color) {
  showFlash(
    context: Get.context!,
    duration: Duration(seconds: 5),
    builder: (_, controller) {
      return Flash(
        margin: EdgeInsets.all(20),
        controller: controller,
        borderRadius: BorderRadius.circular(8.0),
        boxShadows: kElevationToShadow[8],
        backgroundColor: color,
        onTap: () => controller.dismiss(),
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        child: FlashBar(
          title: Text(
            title,
            style: Get.textTheme!.headline5,
          ),
          message: Text(message),
        ),
      );
    },
  );
}

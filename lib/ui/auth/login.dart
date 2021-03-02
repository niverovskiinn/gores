import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/controllers/auth_controller.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class LoginPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(),
        body: DefaultWrapper(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

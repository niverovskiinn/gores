import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/base/style.dart';
import 'package:gores/controllers/auth_controller.dart';
import 'package:gores/controllers/login_controller.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/default_button.dart';
import 'package:gores/ui/widgets/default_password.dart';
import 'package:gores/ui/widgets/default_text_field.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
          child: Row(
            children: [
              DefaultButton(
                onTap: () => Get.toNamed(Routes.signup),
                title: signUp.tr.toUpperCase(),
              ),
              Spacer(),
              DefaultButton(
                onTap: () async {
                  if (await controller.next()) {
                    Get.offAllNamed(Routes.home);
                  }
                },
                title: next.tr.toUpperCase(),
              ),
            ],
          ),
        ),
        body: DefaultWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: topSpace,
              ),
              Text(
                authorization.tr,
                style: Get.textTheme.headline3,
              ),
              SizedBox(
                height: verticalDefaultSize,
              ),
              DefaultTextField(
                hint: email.tr,
                onChanged: (value) => controller.email = value,
              ),
              SizedBox(
                height: verticalDefaultSize,
              ),
              DefaultPassword(
                hint: password.tr,
                onChanged: (value) => controller.password = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

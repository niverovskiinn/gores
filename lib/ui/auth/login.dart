import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/controllers/login_controller.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/default_button.dart';
import 'package:gores/ui/widgets/default_password.dart';
import 'package:gores/ui/widgets/default_text_field.dart';
import 'package:gores/ui/widgets/wrapper.dart';
import 'package:gores/utils/snackbars.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(
          locale: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
          child: Row(
            children: [
              DefaultButton(
                onTap: () => Get.toNamed(Routes.signup),
                title: signUpStr.tr.toUpperCase(),
              ),
              Spacer(),
              DefaultButton(
                onTap: () async {
                  await controller.next();
                },
                title: nextStr.tr.toUpperCase(),
              ),
            ],
          ),
        ),
        body: DefaultWrapper(
          child: Center(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: kIsWeb ? webTopSpace : mobileTopSpace,
                  ),
                  Text(
                    authorizationStr.tr,
                    style: Get.textTheme!.headline3,
                  ),
                  SizedBox(
                    height: verticalDefaultSize,
                  ),
                  DefaultTextField(
                    hint: emailStr.tr,
                    onChanged: (value) => controller.email = value,
                  ),
                  SizedBox(
                    height: verticalDefaultSize,
                  ),
                  DefaultPassword(
                    hint: passwordStr.tr,
                    onChanged: (value) => controller.password = value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

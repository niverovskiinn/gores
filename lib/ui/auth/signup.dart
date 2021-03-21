import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/controllers/signup_controller.dart';
import 'package:gores/data/models/roles.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/default_button.dart';
import 'package:gores/ui/widgets/default_password.dart';
import 'package:gores/ui/widgets/default_phone_field.dart';
import 'package:gores/ui/widgets/default_text_field.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(
          back: true,
          locale: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
          child: Row(
            children: [
              Spacer(),
              DefaultButton(
                onTap: () async {
                  await controller.signUp();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kIsWeb ? webTopSpace : mobileTopSpace,
                  ),
                  Text(
                    signUpStr.tr,
                    style: Get.textTheme!.headline3,
                  ),
                  SizedBox(
                    height: verticalDefaultSize,
                  ),
                  Text(
                    kIsWeb ? addRest.tr : joinUs.tr,
                    style: Get.textTheme!.headline6,
                  ),
                  SizedBox(
                    height: verticalDefaultSize,
                  ),
                  DefaultTextField(
                    hint: nameStr.tr,
                    onChanged: (value) => controller.name = value,
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
                  DefaultPhoneField(
                    onChanged: (value) =>
                        controller.phone = value.completeNumber,
                  ),
                  SizedBox(
                    height: verticalDefaultSize,
                  ),
                  DefaultPassword(
                    hint: passwordStr.tr,
                    onChanged: (value) => controller.password = value,
                  ),
                  SizedBox(
                    height: verticalDefaultSize,
                  ),
                  DefaultPassword(
                    hint: confirmPassword.tr,
                    onChanged: (value) => controller.confPassword = value,
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

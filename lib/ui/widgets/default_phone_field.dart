import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/route_manager.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/style.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class DefaultPhoneField extends StatelessWidget {
  final void Function(PhoneNumber) onChanged;
  const DefaultPhoneField({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: -neumorphicDepth,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: textFieldHorizontalPadding,
      child: IntlPhoneField(
        dialogDecoration: BoxDecoration(),
        dialogCountriesStyle: Get.textTheme.bodyText2,
        initialCountryCode: 'UA',
        onChanged: onChanged,
      ),
    );
  }
}

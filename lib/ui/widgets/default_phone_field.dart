import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/phone_number.dart';
import 'package:gores/ui/widgets/phone_field.dart';

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
      child: PhoneField(
        searchText: countrySearch.tr,
        keyboardType: TextInputType.phone,
        dialogDecoration: BoxDecoration(),
        dialogCountriesStyle: Get.textTheme.bodyText2,
        initialCountryCode: 'UA',
        onChanged: onChanged,
      ),
    );
  }
}

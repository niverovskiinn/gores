import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final EdgeInsets margin;
  const DefaultButton({
    Key key,
    this.title,
    this.onTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.stadium(),
        color: Colors.transparent,
        shadowDarkColor: Colors.black,
      ),
      minDistance: -neumorphicDepth,
      margin: margin,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 12,
      ),
      onPressed: onTap,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Get.textTheme.button.copyWith(
          color: Colors.black45,
        ),
      ),
    );
  }
}

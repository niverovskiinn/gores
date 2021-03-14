import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gores/base/dimensions.dart';

class DefaultTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  const DefaultTextField({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: -neumorphicDepth,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: textFieldHorizontalPadding,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

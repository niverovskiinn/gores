import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gores/base/dimensions.dart';

class DefaultTextArea extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int maxLines;
  const DefaultTextArea({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
    this.maxLines = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: -neumorphicDepth,
      ),
      padding: textFieldHorizontalPadding,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

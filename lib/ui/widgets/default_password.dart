import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gores/base/dimensions.dart';

class DefaultPassword extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const DefaultPassword({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _DefaultPasswordState createState() => _DefaultPasswordState();
}

class _DefaultPasswordState extends State<DefaultPassword> {
  bool _visibility = false;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: -neumorphicDepth,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: textFieldHorizontalPadding,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: TextField(
              controller: widget.controller,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: widget.hint,
              ),
              obscureText: !_visibility,
              onChanged: widget.onChanged,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              splashRadius: 25,
              icon: Icon(_visibility ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() => _visibility = !_visibility);
              },
            ),
          )
        ],
      ),
    );
  }
}

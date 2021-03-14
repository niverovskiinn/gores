import 'package:flutter/material.dart';
import 'package:gores/base/dimensions.dart';

class DefaultWrapper extends StatelessWidget {
  final Widget child;
  const DefaultWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: defaultHorizontalPadding,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: child,
        ),
      ),
    );
  }
}

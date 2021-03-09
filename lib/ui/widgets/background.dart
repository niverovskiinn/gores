import 'package:flutter/material.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/style.dart';

class DefaultBackground extends StatelessWidget {
  final Widget child;
  const DefaultBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: aquamarineColor,
        // gradient: LinearGradient(
        //   colors: [greenColor, aquamarineColor],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
      ),
      child: child,
    );
  }
}

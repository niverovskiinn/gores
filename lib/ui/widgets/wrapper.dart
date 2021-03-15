import 'package:flutter/material.dart';
import 'package:gores/base/dimensions.dart';

class DefaultWrapper extends StatelessWidget {
  final Widget child;
  final bool scrollable;
  const DefaultWrapper({
    Key? key,
    required this.child,
    this.scrollable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: defaultHorizontalPadding,
        child: scrollable
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: child,
              )
            : child,
      ),
    );
  }
}

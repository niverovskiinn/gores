import 'package:flutter/material.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/images.dart';
import 'package:gores/base/style.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading;
  final Widget trailing;
  final Widget center;
  final String title;
  DefaultAppBar({
    Key key,
    this.leading,
    this.trailing,
    this.title,
    this.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [Colors.black, greyColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      height: appbarHeight,
      width: double.infinity,
      padding: defaultHorizontalPadding,
      child: Row(
        children: [
          if (leading != null) leading,
          Image.asset(
            Images.logo,
            height: 40,
            width: 40,
          ),
          if (center != null) center,
          if (title != null)
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);
}

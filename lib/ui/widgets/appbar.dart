import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/images.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/lang/translation_service.dart';
import 'package:gores/base/lang/ua_UA.dart';
import 'package:gores/base/style.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading;
  final Widget trailing;
  final Widget center;
  final String title;
  final bool back;
  final bool locale;
  DefaultAppBar({
    Key key,
    this.leading,
    this.trailing,
    this.title,
    this.center,
    this.back = false,
    this.locale = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            greenColor,
            aquamarineColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      height: appbarHeight,
      width: double.infinity,
      padding: defaultHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leading != null) leading,
          if (back)
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                  splashColor: pinkColor,
                ),
              ),
            ),
          Image.asset(
            Images.logo,
            height: 30,
            width: 30,
          ),
          if (center != null) center,
          if (title != null)
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          if (locale)
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: Text(
                    Get.locale == TranslationService.ua
                        ? en_US['flag']
                        : ua_UA['flag'],
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () async {
                    await Get.find<TranslationService>().changeLocale(
                        Get.locale == TranslationService.en
                            ? TranslationService.ua
                            : TranslationService.en);
                  },
                  splashColor: pinkColor,
                ),
              ),
            ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarHeight);
}

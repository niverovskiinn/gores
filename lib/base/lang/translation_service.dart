import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ua_UA.dart';
import 'en_US.dart';

class TranslationService extends Translations {
  static final locale = Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ua_UA': ua_UA,
      };
}

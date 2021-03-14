import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sga'
import 'ua_UA.dart';
import 'en_US.dart';

class TranslationService extends Translations {
  static final locale = en;
  static final fallbackLocale = en;
  static const en = Locale('en', 'US');
  static const ua = Locale('ua', 'UA');

  @override
  Map<String, Map<String, String>> get keys => {
        '$en': en_US,
        '$ua': ua_UA,
      };

  Future<void> changeLocale(Locale locale) async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    await _sharedPreferences.setString("languageCode", locale.languageCode);
    await _sharedPreferences.setString("countryCode", locale.countryCode!);

    Get.updateLocale(locale);
  }

  Future<void> restoreLocale() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    final langCode = _sharedPreferences.getString("languageCode");
    final countCode = _sharedPreferences.getString("countryCode");

    if (langCode != null && countCode != null) {
      Get.updateLocale(Locale(langCode, countCode));
    }
  }
}

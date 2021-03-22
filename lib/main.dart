import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/data/repository/auth_repository.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/loading.dart';
import 'base/lang/translation_service.dart';
import 'base/routes.dart';
import 'base/style.dart';
import 'di/modules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase init
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.onlyBuilder,
      initialBinding: InitialBinding(),
      getPages: getPages,
      translations: Get.put<TranslationService>(TranslationService()),
      locale: Get.deviceLocale,
      fallbackLocale: TranslationService.fallbackLocale,
      title: 'GoRes',
      theme: appTheme,
      home: Root(),
      onReady: prepare,
    );
  }

  void prepare() async {
    await Get.find<TranslationService>().restoreLocale();

    if (Get.find<AuthRepository>().isLoggedIn()) {
      Get.offAllNamed(kIsWeb ? Routes.adminHome : Routes.home);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Center(
        child: Loading(),
      ),
    );
  }
}

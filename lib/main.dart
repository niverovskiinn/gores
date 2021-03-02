import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      initialBinding: InitialBinding(),
      getPages: getPages,
      locale: TranslationService.locale,
      title: 'GoRes',
      theme: appTheme,
      home: Root(),
      onReady: checkLoggedIn,
    );
  }

  void checkLoggedIn() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.login);
    });
  }
}

class Root extends StatelessWidget {
  Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Center(
        child: Loading(),
      ),
    );
  }
}

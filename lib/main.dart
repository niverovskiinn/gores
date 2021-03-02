import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      home: InitialPage(),
    );
  }
}

class InitialPage extends StatefulWidget {
  InitialPage({Key key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

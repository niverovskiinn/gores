import 'package:get/get.dart';
import 'package:gores/ui/home/home.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md
abstract class Routes {
  static const home = "/";
  static const splashScreen = "/splash-screen";
}

final getPages = [
  GetPage(
    name: Routes.home,
    page: () => HomeScreen(),
  ),
];

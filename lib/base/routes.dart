import 'package:get/get.dart';
import 'package:gores/ui/auth/login.dart';
import 'package:gores/ui/home/home.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md
abstract class Routes {
  static const home = "/";
  static const login = "/login";
  // static const signup = "/signup";
}

final getPages = [
  GetPage(
    name: Routes.home,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
  ),
];

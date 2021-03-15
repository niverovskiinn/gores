import 'package:get/get.dart';
import 'package:gores/ui/auth/login.dart';
import 'package:gores/ui/auth/signup.dart';
import 'package:gores/ui/mobile/home/home.dart';
import 'package:gores/ui/mobile/restaurant/restaurant.dart';
import 'package:gores/ui/web/admin_home/admin_home.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md
abstract class Routes {
  static const home = "/home";
  static const login = "/login";
  static const signup = "/signup";
  static const adminHome = "/adminHome";
  static String restaurantId(String? id) {
    return "/restaurant/$id";
  }
}

final getPages = [
  GetPage(
    name: Routes.home,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: Routes.restaurantId(":id"),
    page: () => RestaurantPage(),
  ),
  GetPage(
    name: Routes.login,
    page: () => LoginPage(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => SignUpPage(),
  ),
  GetPage(
    name: Routes.adminHome,
    page: () => AdminHomePage(),
  ),
];

import 'package:get/get.dart';

class HomeController extends GetxController {
  var _searchVisible = false.obs;
  set searchVisible(bool value) => this._searchVisible.value = value;
  bool get searchVisible => this._searchVisible.value;
}

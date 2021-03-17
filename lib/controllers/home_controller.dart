import 'package:get/get.dart';
import 'package:gores/data/database.dart';
import 'package:gores/data/models/restaurant.dart';

class HomeController extends GetxController {
  var _searchVisible = false.obs;
  set searchVisible(bool? value) => this._searchVisible.value = value;
  bool? get searchVisible => this._searchVisible.value;

  var _restaurants = <Restaurant>[].obs;
  set restaurants(List<Restaurant> value) =>
      this._restaurants = value as RxList<Restaurant>;
  List<Restaurant> get restaurants => this._restaurants;

  @override
  void onInit() {
    super.onInit();
  }
}

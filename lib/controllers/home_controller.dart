import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/restaurant_repository.dart';
import 'package:gores/utils/snackbars.dart';

class HomeController extends GetxController {
  final RestaurantRepository _repository;

  HomeController(this._repository);
  @override
  void onInit() async {
    super.onInit();
    final resp = await _repository.getRestaurants();

    resp.fold(
      (err) => snackbarError(errorStr.tr, err.message),
      (stream) {
        _restaurants.bindStream(stream);
      },
    );
  }

  var _searchVisible = false.obs;
  set searchVisible(bool? value) => this._searchVisible.value = value;
  bool? get searchVisible => this._searchVisible.value;

  var _restaurants = <Restaurant?>[].obs;
  set restaurants(List<Restaurant?> value) =>
      this._restaurants = value as RxList<Restaurant?>;
  List<Restaurant?> get restaurants => this._restaurants;
}

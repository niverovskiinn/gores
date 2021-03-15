import 'package:get/get.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/admin_repository.dart';
import 'package:gores/data/repository/auth_repository.dart';

class AdminHomeController extends GetxController {
  final AuthRepository _authRepository;
  final AdminRepository _adminRepository;
  AdminHomeController(this._authRepository, this._adminRepository);

  @override
  void onInit() async {
    super.onInit();
    _restaurants.bindStream(await _adminRepository.getRestaurants());
  }

  var _restaurants = <Restaurant?>[].obs;
  set restaurants(List<Restaurant?> value) =>
      this._restaurants = value as RxList<Restaurant?>;
  List<Restaurant?> get restaurants => this._restaurants;

  var _selectedRestaurant = Rx<Restaurant?>();
  set selectedRestaurant(Restaurant? value) => _selectedRestaurant(value);
  Restaurant? get selectedRestaurant => this._selectedRestaurant();

  void logout() {
    _authRepository.logout();
  }
}

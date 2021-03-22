import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/admin_repository.dart';
import 'package:gores/data/repository/auth_repository.dart';
import 'package:gores/utils/snackbars.dart';

class AdminHomeController extends GetxController {
  final AuthRepository _authRepository;
  final AdminRepository _adminRepository;
  AdminHomeController(this._authRepository, this._adminRepository);

  @override
  void onInit() async {
    super.onInit();
    final resp = await _adminRepository.getRestaurants();

    resp.fold(
      (err) => snackbarError(errorStr.tr, err.message),
      (stream) {
        _restaurants.bindStream(stream);
      },
    );
  }

  var _restaurants = <Restaurant?>[].obs;
  set restaurants(List<Restaurant?> value) =>
      this._restaurants = value as RxList<Restaurant?>;
  List<Restaurant?> get restaurants => this._restaurants;

  var _selectedId = "".obs;
  set selectedId(String? value) => _selectedId.value = value;
  String? get selectedId => this._selectedId.value;

  void logout() {
    _authRepository.logout();
  }
}

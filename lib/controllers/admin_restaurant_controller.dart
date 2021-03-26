import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/reservation.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/admin_repository.dart';
import 'package:gores/data/repository/reservation_repository.dart';
import 'package:gores/utils/snackbars.dart';

class AdminRestaurantController extends GetxController {
  final AdminRepository _adminRepository;
  final ReservationRepository _reservationRepository;
  AdminRestaurantController(
    this._adminRepository,
    this._reservationRepository,
  );

  final _reservations = <Reservation>[].obs;
  set reservations(List<Reservation> value) => this._reservations(value);
  List<Reservation> get reservations => this._reservations;

  final _date = DateTime.now().obs;
  set date(DateTime value) {
    this._date.value = value;
    _getReservations();
  }

  Future<void> _getReservations() async {
    if (restaurant != null) {
      final resp = await _reservationRepository.getReservations(
          restaurant!.id!, Date.fromDateTime(date));
      resp.fold(
        (error) => snackbarError(errorStr.tr, error.message),
        (res) => _reservations.bindStream(res),
      );
    }
  }

  DateTime get date => this._date.value!;

  final _restaurant = Rx<Restaurant>();
  set restaurant(Restaurant? value) {
    this._restaurant(value);
    _getReservations();
  }

  Restaurant? get restaurant => this._restaurant.value;
}

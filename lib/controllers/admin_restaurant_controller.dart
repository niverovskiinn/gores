import 'dart:developer';

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
  ) {
    ever(
      _date,
      (DateTime? val) => _getReservations(
        restId: restaurant!.id!,
        date: Date.fromDateTime(val!),
      ),
    );
    ever(
      _restaurant,
      (Restaurant? rest) {
        date = DateTime.now();
        return _getReservations(
          restId: rest!.id!,
          date: Date.fromDateTime(date ?? DateTime.now()),
        );
      },
    );
  }

  final _reservations = <Reservation>[].obs;
  set reservations(List<Reservation> value) => this._reservations(value);
  List<Reservation> get reservations => this._reservations;

  final _date = Rx<DateTime>();
  set date(DateTime? value) => this._date(value);
  DateTime? get date => this._date.value;

  Future<void> _getReservations(
      {required String restId, required Date date}) async {
    final resp = await _reservationRepository.getReservations(restId, date);
    resp.fold(
      (error) => snackbarError(errorStr.tr, error.message),
      (res) => _reservations.bindStream(res),
    );
  }

  final _restaurant = Rx<Restaurant>();
  set restaurant(Restaurant? value) => this._restaurant(value);
  Restaurant? get restaurant => this._restaurant.value;
}

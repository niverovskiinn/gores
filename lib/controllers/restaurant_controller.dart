import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/profile_controller.dart';
import 'package:gores/data/models/reservation.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/reservation_repository.dart';
import 'package:gores/utils/snackbars.dart';
import 'package:gores/utils/extensions.dart';

class RestaurantController extends GetxController {
  final ReservationRepository _reservationRepository;
  final ProfileController _profileController;
  RestaurantController(Restaurant restaurant, this._reservationRepository,
      this._profileController) {
    this.restaurant = restaurant;
    this
        .restaurant
        .tables
        ?.sort((e1, e2) => (e1.capacity ?? 0).compareTo(e2.capacity ?? 0));
  }
  late final _restaurant = Rx<Restaurant>();
  set restaurant(Restaurant value) {
    this._restaurant.value = value;
    _getReservations();
  }

  Restaurant get restaurant => this._restaurant.value!;

  DateTime get initialDate => DateTime.now();

  DateTime get lastDate => DateTime.now().add(Duration(days: 7));

  int get minPlaces => restaurant.tables?.first.capacity ?? 0;

  int get maxPlaces => restaurant.tables?.last.capacity ?? 0;

  int get minDuration => 1;
  int get maxDuration => 4;

  late final _places = minPlaces.obs;
  set places(int value) => this._places.value = value;
  int get places => this._places.value;

  late final _duration = 0.obs;
  set duration(int value) => this._duration.value = value;
  int get duration => this._duration.value;

  final _selectedDate = DateTime.now().obs;
  set selectedDate(DateTime? value) {
    this._selectedDate.value = value;
    _getReservations();
  }

  DateTime? get selectedDate => this._selectedDate.value;

  final _time = Rx<TimeOfDay>();
  set time(TimeOfDay? value) => this._time.value = value;
  TimeOfDay? get time => this._time.value;

  final _reservations = <Reservation>[].obs;

  Future<void> _getReservations() async {
    if (selectedDate != null) {
      final resp = await _reservationRepository.getReservations(
          restaurant.id!, Date.fromDateTime(selectedDate!));
      resp.fold(
        (error) => snackbarError(errorStr.tr, error.message),
        (res) => _reservations.bindStream(res),
      );
    }
  }

  bool checkTimeForAvailability() {
    if (selectedDate == null || time == null) return false;
    if (_reservations.isEmpty) return true;

    var tablesAmount = restaurant.tables!
            .firstWhere((element) => element.capacity == places)
            .amount ??
        0;
    log("tablesAmount $tablesAmount");

    _reservations.forEach((element) {
      if (element.finishedTime!.isAfter(time!) ||
          element.beginTime!.isBefore(time!.add(duration))) {
        tablesAmount -= 1;
      }
    });
    log("tablesAmount $tablesAmount");

    return tablesAmount > 0;
  }

  Future<void> addReservation() async {
    final reservation = Reservation(
      date: Date.fromDateTime(selectedDate!),
      beginTime: time,
      finishedTime: time!.add(duration),
      tablePlaces: places,
      restId: restaurant.id,
      clientPhone: _profileController.profile!.phone,
    );
    final resp = await _reservationRepository.addReservation(reservation);
    resp.fold((error) => snackbarError(errorStr.tr, error.message), (_) {});
  }
}

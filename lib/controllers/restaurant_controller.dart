import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/data/models/reservation.dart';
import 'package:gores/data/models/restaurant.dart';

class RestaurantController extends GetxController {
  RestaurantController(Restaurant restaurant) {
    this.restaurant = restaurant;
    this
        .restaurant
        .tables
        ?.sort((e1, e2) => (e1.capacity ?? 0).compareTo(e2.capacity ?? 0));
  }
  late final _restaurant = Rx<Restaurant>();
  set restaurant(Restaurant value) => this._restaurant.value = value;
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

  final _selectedDate = Rx<DateTime>();
  set selectedDate(DateTime? value) => this._selectedDate.value = value;
  DateTime? get selectedDate => this._selectedDate.value;

  final _time = Rx<TimeOfDay>();
  set time(TimeOfDay? value) => this._time.value = value;
  TimeOfDay? get time => this._time.value;

  bool checkTimeForAvailability() {
    if (selectedDate == null && time == null) return false;
    final reservation = restaurant.getReservation(
        selectedDate!.year, selectedDate!.month, selectedDate!.day);
    log("reservation $reservation");
    if (reservation == null) return true;
    final dateTime = DateTime(selectedDate!.year, selectedDate!.month,
        selectedDate!.day, time!.hour, time!.minute);
    final finishedDate = dateTime.add(Duration(hours: duration));

    var tablesAmount = restaurant.tables!
            .firstWhere((element) => element.capacity == places)
            .amount ??
        0;
    log("tablesAmount $tablesAmount");

    reservation.events?.forEach((element) {
      if (element.finishedTime!.isAfter(dateTime) ||
          element.time!.isBefore(finishedDate)) {
        tablesAmount -= 1;
      }
    });
    log("tablesAmount $tablesAmount");

    return tablesAmount > 0;
  }
}

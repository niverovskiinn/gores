import 'dart:developer';

import 'package:get/get.dart';
import 'package:gores/data/models/reservation.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/admin_repository.dart';

class AdminRestaurantController extends GetxController {
  final AdminRepository repository;
  AdminRestaurantController({required this.repository});

  Reservation? get reservation {
    Reservation? res;
    restaurant?.reservations?.forEach((element) {
      if (element.date?.day == date?.day &&
          element.date?.month == date?.month &&
          element.date?.year == date?.year) {
        res = element;
      }
    });
    return res;
  }

  final _date = DateTime.now().obs;
  set date(DateTime? value) => this._date.value = value;
  DateTime? get date => this._date.value;

  final _restaurant = Rx<Restaurant>();
  set restaurant(Restaurant? value) => this._restaurant.value = value;
  Restaurant? get restaurant => this._restaurant.value;
}

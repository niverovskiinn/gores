import 'package:get/get.dart';
import 'package:gores/data/models/restaurant.dart';

class RestaurantController extends GetxController {
  RestaurantController(Restaurant? restaurant) {
    this.restaurant = restaurant;
  }
  final _restaurant = Rx<Restaurant>();
  set restaurant(Restaurant? value) => this._restaurant.value = value;
  Restaurant? get restaurant => this._restaurant.value;

  DateTime get initialDate => DateTime.now();

  DateTime get lastDate => DateTime.now().add(Duration(days: 7));

  int get minPlaces => 0;
  int get maxPlaces => 10;

  final _places = 0.obs;
  set places(int value) => this._places.value = value;
  int get places => this._places.value;

  final _selectedDate = Rx<DateTime>();
  set selectedDate(DateTime? value) => this._selectedDate.value = value;
  DateTime? get selectedDate => this._selectedDate.value;
}

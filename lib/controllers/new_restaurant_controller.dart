import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/data/models/price.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/repository/admin_repository.dart';
import 'package:gores/utils/snackbars.dart';
import 'package:uuid/uuid.dart';

class NewRestaurantController extends GetxController {
  final AdminRepository repository;
  NewRestaurantController({required this.repository});

  final _id = Uuid().v4();

  final _name = ''.obs;
  set name(String? value) => this._name.value = value;
  String? get name => this._name.value;

  final _description = ''.obs;
  set description(String? value) => this._description.value = value;
  String? get description => this._description.value;

  final _price = 0.obs;
  int get price => this._price.value;
  set price(int value) => this._price.value = value;

  final _titleUrl = ''.obs;
  String? get titleUrl => this._titleUrl.value;

  final _images = <String>[].obs;
  List<String> get images => this._images.value;

  Price convertPrice(int value) {
    if (value <= 1) {
      return Price.low;
    } else if (value == 2) {
      return Price.medium;
    } else if (value == 3) {
      return Price.high;
    } else {
      return Price.cosmos;
    }
  }

  Future<void> pickTitleImage() async {
    final resp = await repository.pickTitleImage(_id);
    resp.fold(
      (err) => snackbarError(error.tr, err.message),
      (res) => _titleUrl.value = res,
    );
  }

  Future<void> pickImages() async {
    final resp = await repository.pickImages(_id);
    resp.fold(
      (err) => snackbarError(error.tr, err.message),
      (res) => _images(res),
    );
  }

  Future<void> addRestaurant() async {
    if (_validate()) {
      final resp = await repository.addRestaurant(Restaurant(
        id: _id,
        name: name,
        description: description,
        titleImageUrl: titleUrl,
        imageUrls: images,
        price: convertPrice(price),
        visible: true,
      ));
      resp.fold(
        (err) => snackbarError(error.tr, err.message),
        (_) {},
      );
    }
  }

  bool _validate() {
    return true;
  }
}

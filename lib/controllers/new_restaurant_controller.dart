import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/data/models/price.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/data/models/restaurant_tables.dart';
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

  final _address = ''.obs;
  set address(String? value) => this._address.value = value;
  String? get address => this._address.value;

  final _price = Rx<int?>();
  int? get price => this._price.value;
  set price(int? value) => this._price.value = value;

  final _titleUrl = ''.obs;
  String? get titleUrl => this._titleUrl.value;

  final _imagesUrl = <String>[].obs;
  List<String> get images => this._imagesUrl;

  final _tables = <RestaurantTables>[].obs;
  List<RestaurantTables> get tables => this._tables;

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
      (err) => snackbarError(errorStr.tr, err.message),
      (res) => _titleUrl.value = res,
    );
  }

  Future<void> pickImages() async {
    final resp = await repository.pickImages(_id);
    resp.fold(
      (err) => snackbarError(errorStr.tr, err.message),
      (res) => _imagesUrl(res),
    );
  }

  Future<void> addRestaurant() async {
    if (_validate()) {
      final resp = await repository.addRestaurant(
        Restaurant(
            id: _id,
            name: name,
            description: description,
            address: address,
            titleImageUrl: titleUrl,
            imageUrls: images,
            price: convertPrice(price!),
            visible: true,
            tables: tables),
      );
      resp.fold(
        (err) => snackbarError(errorStr.tr, err.message),
        (_) => Get.offAllNamed(Routes.adminHome),
      );
    }
  }

  bool _validate() {
    final nameValid = name != null && name!.isNotEmpty && name!.length > 2;
    if (!nameValid) {
      snackbarError(errorStr.tr, "");
      return false;
    }
    final descriptionValid = description != null && description!.isNotEmpty;
    if (!descriptionValid) {
      snackbarError(errorStr.tr, "");
      return false;
    }
    final addressValid = address != null && address!.isNotEmpty;
    if (!addressValid) {
      snackbarError(errorStr.tr, "");
      return false;
    }
    final priceValid = price != null;
    if (!priceValid) {
      snackbarError(errorStr.tr, "");
      return false;
    }
    final titleImageValid = titleUrl != null && titleUrl!.isNotEmpty;
    if (!titleImageValid) {
      snackbarError(errorStr.tr, "");
      return false;
    }
    final tablesValid = tables.isNotEmpty &&
        tables.every((e) => (e.amount ?? 0) > 0 && (e.capacity ?? 0) > 0);
    if (!tablesValid) {
      snackbarError(errorStr.tr, "");
      return false;
    }
    return true;
  }
}

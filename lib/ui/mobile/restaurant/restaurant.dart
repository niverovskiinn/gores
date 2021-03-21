import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/controllers/restaurant_controller.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/ui/mobile/restaurant/widgets/restaurant_view.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class RestaurantPage extends GetView<RestaurantController> {
  @override
  Widget build(BuildContext context) {
    final restaurant = Get.arguments as Restaurant?;
    print(restaurant);
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(
          back: true,
        ),
        body: DefaultWrapper(
          child: RestaurantView(restaurant: restaurant ?? Restaurant()),
        ),
      ),
    );
  }
}

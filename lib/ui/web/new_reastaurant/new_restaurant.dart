import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/controllers/new_restaurant_controller.dart';

class NewRestaurantPage extends GetView<NewRestaurantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewRestaurantPage')),
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/base/style.dart';
import 'package:gores/controllers/restaurant_controller.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:intl/intl.dart';

class RestaurantView extends StatelessWidget {
  final Restaurant restaurant;
  final RestaurantController? controller;
  RestaurantView({
    Key? key,
    required this.restaurant,
    this.controller,
  }) : super(key: key);
  late final images = [restaurant.titleImageUrl] + (restaurant.imageUrls ?? []);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.imageView, arguments: images[index]);
                },
                child: Image.network(
                  images[index]!,
                  fit: BoxFit.contain,
                ),
              );
            },
            itemCount: images.length,
            control: SwiperControl(color: pinkColor),
          ),
        ),
        Text(
          restaurant.name ?? unknown.tr,
          style: Get.textTheme?.headline4,
        ),
        Text(
          restaurant.address ?? unknown.tr,
          style: Get.textTheme?.headline6,
        ),
        Text(
          restaurant.description ?? unknown.tr,
          style: Get.textTheme?.subtitle2,
        ),
        if (controller != null) _buildReservation(context),
      ],
    );
  }

  Widget _buildReservation(
    BuildContext context,
  ) {
    return Obx(
      () => Column(
        children: [
          Text(
            "Reserved",
            style: Get.textTheme?.headline6,
          ),
          TextButton(
            onPressed: () async {
              controller!.selectedDate = await showDatePicker(
                context: context,
                initialDate: controller!.initialDate,
                firstDate: controller!.initialDate,
                lastDate: controller!.lastDate,
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: greenColor,
                      accentColor: greenColor,
                      colorScheme: ColorScheme.light(primary: greenColor),
                    ),
                    child: child!,
                  );
                },
              );
            },
            child: Text(controller!.selectedDate != null
                ? DateFormat('dd.MM.yyyy').format(
                    controller!.selectedDate!,
                  )
                : "Pick date"),
          ),
          Text("Table places amount"),
          Row(
            children: [
              Expanded(
                child: NeumorphicSlider(
                  value: controller!.places.ceilToDouble(),
                  onChanged: (val) => controller!.places = val.ceil(),
                  min: controller!.minPlaces.ceilToDouble(),
                  max: controller!.maxPlaces.ceilToDouble(),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(controller!.places.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

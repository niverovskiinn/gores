import 'dart:developer';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/base/style.dart';
import 'package:gores/controllers/restaurant_controller.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/utils/snackbars.dart';
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
        if (controller != null)
          Neumorphic(
            style: NeumorphicStyle(
              color: Colors.transparent,
              depth: -neumorphicDepth,
            ),
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(8),
            child: _buildReservation(context),
          ),
      ],
    );
  }

  Widget _buildReservation(
    BuildContext context,
  ) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            reservation.tr,
            style: Get.textTheme?.headline6,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () async => await _showDatePicker(context),
            child: Text(controller!.selectedDate != null
                ? DateFormat('dd.MM.yyyy').format(
                    controller!.selectedDate!,
                  )
                : pickDate.tr),
          ),
          SizedBox(
            height: 10,
          ),
          _buildPlacesAmounts(context),
          SizedBox(
            height: 10,
          ),
          _buildDuration(context),
          SizedBox(
            height: 10,
          ),
          if (controller!.duration > 0)
            TextButton(
              onPressed: () async => await _showTimePicker(context),
              child: Text(controller!.time != null
                  ? DateFormat('HH:mm').format(
                      controller!.selectedDate!,
                    )
                  : selectTime.tr),
            ),
          if (controller!.time != null)
            NeumorphicButton(
              style: NeumorphicStyle(color: Colors.transparent),
              margin: EdgeInsets.symmetric(horizontal: 20),
              onPressed: () {},
              child: Text(
                submit.tr,
                textAlign: TextAlign.center,
              ),
            )
        ],
      ),
    );
  }

  Widget _buildDuration(
    BuildContext context,
  ) {
    return controller!.places > 0 && controller!.selectedDate != null
        ? Column(
            children: [
              Text(
                selectDuration.tr,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: NeumorphicSlider(
                      style: SliderStyle(accent: pinkColor, variant: pinkColor),
                      value: controller!.duration.ceilToDouble(),
                      onChanged: (val) => controller!.duration = val.ceil(),
                      min: controller!.minDuration.ceilToDouble(),
                      max: controller!.maxDuration.ceilToDouble(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    controller!.duration.toString(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          )
        : SizedBox();
  }

  Widget _buildPlacesAmounts(
    BuildContext context,
  ) {
    if (controller!.selectedDate == null) {
      return SizedBox();
    } else if (controller!.minPlaces != controller!.maxPlaces) {
      return Column(
        children: [
          Text(
            tablePlacesAmount.tr,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: NeumorphicSlider(
                  style: SliderStyle(accent: pinkColor, variant: pinkColor),
                  value: controller!.places.ceilToDouble(),
                  onChanged: (val) => controller!.places = val.ceil(),
                  min: controller!.minPlaces.ceilToDouble(),
                  max: controller!.maxPlaces.ceilToDouble(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(controller!.places.toString()),
            ],
          ),
        ],
      );
    } else {
      return Text(
        availableTables.trParams({placesStr: controller!.places.toString()})!,
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> _showTimePicker(BuildContext context) async {
    controller!.time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(controller!.initialDate),
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
    print(controller!.time);
    if (controller!.time != null && controller!.checkTimeForAvailability()) {
      controller!.selectedDate = DateTime(
        controller!.selectedDate!.year,
        controller!.selectedDate!.month,
        controller!.selectedDate!.day,
        controller!.time!.hour,
        controller!.time!.minute,
      );
    } else {
      snackbarError(errorStr.tr, timeNotAvailable.tr);
    }
    print(controller!.selectedDate);
  }

  Future<void> _showDatePicker(BuildContext context) async {
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
  }
}

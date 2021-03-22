import 'package:gores/base/lang/en_US.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/controllers/admin_restaurant_controller.dart';
import 'package:gores/data/models/restaurant.dart';

class AdminRestaurantPage extends StatelessWidget {
  final Restaurant item;
  final controller = AdminRestaurantController(repository: Get.find());

  AdminRestaurantPage({Key? key, required this.item}) : super(key: key) {
    controller.restaurant = item;
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reservations",
            style: Get.textTheme?.headline3,
          ),
          _buildDateButton(context),
          _buildReservationsTable(context),
        ],
      ),
    );
  }

  Widget _buildReservationsTable(
    BuildContext context,
  ) {
    final timeFormat = (DateTime? time) =>
        time != null ? DateFormat('HH:mm').format(time) : unknown.tr;
    return Table(
      children: [
            TableRow(children: [
              Text(
                "Client Phone",
                textAlign: TextAlign.center,
                style: Get.textTheme!.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Begin Time",
                textAlign: TextAlign.center,
                style: Get.textTheme!.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Finished Time",
                textAlign: TextAlign.center,
                style: Get.textTheme!.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "People amount",
                textAlign: TextAlign.center,
                style: Get.textTheme!.subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ])
          ] +
          (controller.reservation?.events
                  ?.map(
                    (e) => TableRow(children: [
                      Text(
                        e.clientPhone ?? unknown.tr,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        timeFormat(e.time),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        timeFormat(e.finishedTime),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        e.tablePlaces?.toString() ?? unknown.tr,
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  )
                  .toList() ??
              []),
    );
  }

  Widget _buildDateButton(
    BuildContext context,
  ) {
    return TextButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: controller.date ?? DateTime.now(),
          firstDate: controller.restaurant?.created ?? DateTime.now(),
          lastDate: DateTime.now().add(
            Duration(days: 7),
          ),
        ).then((value) => controller.date = value);
      },
      child: Text(
        DateFormat('dd.MM.yyyy').format(
          controller.date ?? DateTime.now(),
        ),
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

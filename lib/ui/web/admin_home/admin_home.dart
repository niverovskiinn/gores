import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/base/style.dart';
import 'package:gores/controllers/admin_home_controller.dart';
import 'package:gores/ui/mobile/home/widgets/restaurant_item.dart';
import 'package:gores/ui/web/admin_home/widgets/admin_restaurant_view.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class AdminHomePage extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(
          trailing: NeumorphicButton(
            style: NeumorphicStyle(
              color: Colors.transparent,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: Icon(
              Icons.logout,
            ),
            onPressed: () {
              controller.logout();
            },
          ),
        ),
        body: DefaultWrapper(
          scrollable: false,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Obx(
                    () {
                      return ListView(
                        children: controller.restaurants.map(
                          (e) {
                            return e != null
                                ? ListTile(
                                    selectedTileColor: greenColor,
                                    selected: e.id == controller.selectedId,
                                    title: Text(
                                      e.name ?? unknown.tr,
                                      style: Get.textTheme!.headline5,
                                    ),
                                    onTap: () => controller.selectedId = e.id,
                                  )
                                : SizedBox();
                          },
                        ).toList()
                          ..add(NeumorphicButton(
                            margin: EdgeInsets.all(20),
                            style: NeumorphicStyle(
                              color: Colors.transparent,
                              boxShape: NeumorphicBoxShape.circle(),
                            ),
                            child: Icon(
                              Icons.add,
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.newRestaurant);
                            },
                          )),
                      );
                    },
                  )),
              Expanded(
                  flex: 4,
                  child: Obx(
                    () => controller.selectedId != null &&
                            (controller.selectedId?.isNotEmpty ?? false)
                        ? AdminRestaurantPage(
                            item: controller.restaurants.firstWhere(
                                (e) => e?.id == controller.selectedId)!,
                          )
                        : Center(
                            child: Text(
                              "Select cafe",
                              style: Get.textTheme?.headline4?.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

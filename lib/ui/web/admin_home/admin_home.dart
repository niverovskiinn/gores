import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/controllers/admin_home_controller.dart';
import 'package:gores/data/repository/admin_repository.dart';
import 'package:gores/ui/mobile/home/widgets/restaurant_item.dart';
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
                    () => ListView(
                      children: controller.restaurants
                          .map(
                            (e) => e != null
                                ? ListTile(
                                    title: Text(
                                      e.name ?? unknown.tr,
                                      style: Get.textTheme!.headline5,
                                    ),
                                    onTap: () =>
                                        controller.selectedRestaurant = e,
                                  )
                                : SizedBox(),
                          )
                          .toList()
                            ..add(NeumorphicButton(
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
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Obx(
                    () => controller.selectedRestaurant != null
                        ? RestaurantItem(
                            item: controller.selectedRestaurant!,
                          )
                        : Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.find<AdminRepository>()
                                      .pickImages("restId");
                                },
                                child: Text("pickImages"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.find<AdminRepository>()
                                      .pickTitleImage("restId");
                                },
                                child: Text("pickTitleImage"),
                              ),
                            ],
                          ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

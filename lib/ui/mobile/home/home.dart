import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/data/repository/auth_repository.dart';
import 'package:gores/controllers/home_controller.dart';
import 'package:gores/data/models/price.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/ui/mobile/home/widgets/loading_restaurants.dart';
import 'package:gores/ui/mobile/home/widgets/restaurant_item.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/search_field.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

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
            child: Icon(Icons.person),
            onPressed: () {
              Get.find<AuthRepository>().logout();
            },
          ),
          leading: NeumorphicButton(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
              color: Colors.transparent,
            ),
            child: Icon(Icons.search),
            onPressed: () =>
                controller.searchVisible = !controller.searchVisible!,
          ),
        ),
        body: DefaultWrapper(
          child: Obx(
            () => Column(
              children: [
                if (controller.searchVisible!)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SearchField(),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (controller.searchVisible! ? .75 : .85),
                  child: controller.restaurants.isEmpty
                      ? _buildRestList(context, controller.restaurants)
                      : LoadingRestaurantList(
                          itemsAmount: 3,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestList(
    BuildContext context,
    List<Restaurant> restaurants,
  ) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.fromLTRB(10, i == 0 ? 10 : 0, 10, 10),
          child: RestaurantItem(
            item: Restaurant(
              id: "12",
              titleImageUrl:
                  'https://cityhost.ua/upload_img/blog5ef308ea5529c_trash2-01.jpg',
              name: "NameNameNameNameNameName",
              description:
                  "qwere asd asdsds we saa asewerewerwqqwere asd asdsds we saa asewerewerwqqwere asd asdsds we saa asewerewerwq",
              rating: 3.8,
              price: Price.high,
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}

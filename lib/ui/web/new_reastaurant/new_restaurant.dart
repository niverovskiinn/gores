import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/new_restaurant_controller.dart';
import 'package:gores/data/models/restaurant.dart';
import 'package:gores/ui/mobile/restaurant/widgets/restaurant_view.dart';
import 'package:gores/ui/web/new_reastaurant/widgets/tables_selector.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/default_text_area.dart';
import 'package:gores/ui/widgets/default_text_field.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class NewRestaurantPage extends StatelessWidget {
  final controller = NewRestaurantController(repository: Get.find());
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(
          back: true,
          trailing: IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print(controller.tables);
            },
          ),
        ),
        body: DefaultWrapper(
          scrollable: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildRestaurantForm(context),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: _buildRestaurantPreview(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestaurantForm(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DefaultTextField(
            hint: nameStr.tr,
            onChanged: (val) => controller.name = val,
          ),
          SizedBox(
            height: 15,
          ),
          DefaultTextArea(
            hint: descriptionStr.tr,
            onChanged: (val) => controller.description = val,
          ),
          SizedBox(
            height: 15,
          ),
          DefaultTextField(
            hint: addressStr.tr,
            onChanged: (val) => controller.address = val,
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                priceStr.tr,
                style: Get.textTheme!.subtitle1!.copyWith(fontSize: 20),
              ),
              RatingBar.builder(
                itemBuilder: (context, _) => Icon(Icons.attach_money),
                onRatingUpdate: (val) {
                  controller.price = val.ceil();
                },
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          NeumorphicButton(
            child: Text(pickTitleImage.tr),
            onPressed: () {},
          ),
          SizedBox(
            height: 15,
          ),
          NeumorphicButton(
            child: Text(pickImages.tr),
            onPressed: () {},
          ),
          SizedBox(
            height: 15,
          ),
          TablesSelector(
            controller: controller,
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantPreview(
    BuildContext context,
  ) {
    return Stack(
      children: [
        IgnorePointer(
            child: Neumorphic(
                style: NeumorphicStyle(
                  depth: -neumorphicDepth,
                  color: Colors.transparent,
                ),
                child: RestaurantView(
                  restaurant: Restaurant(
                    name: controller.name,
                    description: controller.description,
                    imageUrls: controller.images,
                    titleImageUrl: controller.titleUrl,
                    price: controller.price != null
                        ? controller.convertPrice(controller.price!)
                        : null,
                    tables: controller.tables,
                  ),
                ))),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            previewStr.tr,
            style: Get.textTheme!.headline4!,
          ),
        ),
      ],
    );
  }
}

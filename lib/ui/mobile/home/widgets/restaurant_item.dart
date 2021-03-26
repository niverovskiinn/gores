import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/base/style.dart';
import 'package:gores/data/models/price.dart';
import 'package:gores/data/models/restaurant.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant item;
  const RestaurantItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => NeumorphicButton(
        padding: EdgeInsets.zero,
        onPressed: () => Get.toNamed(
          Routes.restaurantId(item.id),
          arguments: item,
        ),
        style: NeumorphicStyle(
          intensity: 3,
        ),
        child: SizedBox(
          width: double.infinity,
          height: constraints.maxWidth * .7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 3,
                  child: Image.network(
                    item.titleImageUrl!,
                    fit: BoxFit.fitHeight,
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name!,
                        style: Get.textTheme!.headline6,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.description!,
                        style: Get.textTheme!.bodyText1!
                            .copyWith(color: Colors.grey),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // RatingBarIndicator(
                      //   rating: item.rating ?? 0,
                      //   itemBuilder: (context, index) => Icon(
                      //     Icons.star,
                      //     color: pinkColor,
                      //   ),
                      //   itemCount: 5,
                      //   itemSize: 15,
                      //   direction: Axis.horizontal,
                      // ),
                      _buildPrice(item.price),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrice(Price? price) {
    late double selected;
    switch (price) {
      case Price.low:
        selected = 1;
        break;
      case Price.medium:
        selected = 2;
        break;
      case Price.high:
        selected = 3;
        break;
      case Price.cosmos:
        selected = 4;
        break;
      default:
        selected = 0;
    }
    return RatingBarIndicator(
      rating: selected,
      itemBuilder: (context, index) => Icon(
        Icons.attach_money,
        color: greenColor,
      ),
      itemCount: 4,
      itemSize: 15,
      direction: Axis.horizontal,
    );
  }
}

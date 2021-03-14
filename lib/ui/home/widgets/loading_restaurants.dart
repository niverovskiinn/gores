import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRestaurantList extends StatelessWidget {
  final int itemsAmount;

  const LoadingRestaurantList({Key? key, required this.itemsAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, i == 0 ? 10 : 0, 10, 10),
            child: LoadingRestaurantItem(),
          );
        },
        itemCount: itemsAmount,
      ),
    );
  }
}

class LoadingRestaurantItem extends StatelessWidget {
  const LoadingRestaurantItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        width: double.infinity,
        height: constraints.maxWidth * .7,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(8)),
                  color: Colors.white,
                ),
                constraints: BoxConstraints.expand(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildTitle()),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(child: _buildDescription()),
                    SizedBox(
                      height: 8,
                    ),
                    _buildRatingPrice(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRatingPrice() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: 15,
          color: Colors.white,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          height: 15,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: Get.textTheme!.bodyText1!.fontSize,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: Get.textTheme!.bodyText1!.fontSize,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: Get.textTheme!.bodyText1!.fontSize,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: Get.textTheme!.bodyText1!.fontSize,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: Get.textTheme!.headline6!.fontSize,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: Get.textTheme!.headline6!.fontSize,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: Get.textTheme!.headline6!.fontSize,
          color: Colors.white,
        ),
      ],
    );
  }
}

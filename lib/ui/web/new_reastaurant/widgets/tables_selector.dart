import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/controllers/new_restaurant_controller.dart';
import 'package:gores/data/models/restaurant_tables.dart';

class TablesSelector extends StatefulWidget {
  final NewRestaurantController controller;
  const TablesSelector({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TablesSelectorState createState() => _TablesSelectorState();
}

class _TablesSelectorState extends State<TablesSelector> {
  var value = .0;
  NewRestaurantController? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tablesStr.tr,
              style: Get.textTheme!.subtitle1!.copyWith(fontSize: 20),
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                color: Colors.transparent,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(Icons.add),
              onPressed: () {
                controller!.tables
                    .add(RestaurantTables(capacity: 0, amount: 0));
              },
            )
          ],
        ),
        Obx(
          () => controller!.tables.isNotEmpty
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            amountStr.tr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            placesStr.tr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ...List.generate(
                        controller!.tables.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: _buildTablesRow(
                                  context, controller!.tables[index], index),
                            ))
                  ],
                )
              : SizedBox(),
        ),
      ],
    );
  }

  Widget _buildTablesRow(
      BuildContext context, RestaurantTables tables, int index) {
    return Row(
      children: [
        Expanded(
          child: NeumorphicSlider(
            value: tables.amount?.toDouble() ?? .0,
            max: 50,
            min: 1,
            onChanged: (v) => setState(() => tables.amount = v.ceil()),
          ),
        ),
        Text(tables.amount?.toStringAsFixed(0) ?? "0"),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: NeumorphicSlider(
            value: tables.capacity?.toDouble() ?? .0,
            max: 50,
            min: 1,
            onChanged: (v) => setState(() => tables.capacity = v.ceil()),
          ),
        ),
        Text(tables.capacity?.toStringAsFixed(0) ?? "0"),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            controller!.tables.removeAt(index);
          },
        )
      ],
    );
  }
}

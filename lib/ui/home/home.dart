import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gores/controllers/home_controller.dart';
import 'package:gores/ui/widgets/appbar.dart';
import 'package:gores/ui/widgets/background.dart';
import 'package:gores/ui/widgets/search_field.dart';
import 'package:gores/ui/widgets/wrapper.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      child: Scaffold(
        appBar: DefaultAppBar(),
        body: DefaultWrapper(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SearchField(),
              ListView.builder(
                itemBuilder: (context, i) {},
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

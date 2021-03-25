import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:gores/base/dimensions.dart';
import 'package:gores/base/lang/en_US.dart';
import 'package:gores/base/routes.dart';
import 'package:gores/base/style.dart';
import 'package:gores/data/models/restaurant.dart';

class SearchField extends StatelessWidget {
  final List<Restaurant> rests;
  SearchField({Key? key, required this.rests}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: -neumorphicDepth,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: textFieldHorizontalPadding,
      child: TypeAheadField<Restaurant>(
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greenColor,
        ),
        noItemsFoundBuilder: (context) => Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Nnothing',
            style: Get.textTheme?.bodyText1?.copyWith(
              color: Colors.black38,
              fontSize: 18,
            ),
          ),
        ),
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontStyle: FontStyle.italic),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you looking for?'),
        ),
        suggestionsCallback: (pattern) async {
          return rests.where((element) =>
              (element.description?.contains(pattern) ?? false) ||
              (element.name?.contains(pattern) ?? false) ||
              (element.address?.contains(pattern) ?? false));
        },
        itemBuilder: _builderResult,
        onSuggestionSelected: (suggestion) {
          Get.toNamed(Routes.restaurantId(suggestion.id),
              arguments: suggestion);
        },
      ),
    );
  }

  Widget _builderResult(BuildContext context, restaurant) {
    return ListTile(
      title: Text(restaurant.name ?? unknown.tr),
      subtitle: Text(restaurant.address ?? unknown.tr),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gores/base/dimensions.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: Colors.transparent,
        depth: -neumorphicDepth,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: textFieldHorizontalPadding,
      child: TypeAheadField(
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
          return [];
        },
        itemBuilder: (context, dynamic suggestion) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(suggestion['name']),
            subtitle: Text('\$${suggestion['price']}'),
          );
        },
        onSuggestionSelected: (dynamic suggestion) {
          print(suggestion);
        },
      ),
    );
  }
}

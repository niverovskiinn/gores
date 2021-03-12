import 'package:freezed_annotation/freezed_annotation.dart';

import 'price.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
abstract class Restaurant with _$Restaurant {
  factory Restaurant({
    String id,
    String name,
    double rating,
    String description,
    String titleImageUrl,
    List<String> imageUrls,
    Price price,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

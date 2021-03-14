import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? titleImageUrl;
  final double? rating;
  final Price? price;
  final List<String>? imageUrls;
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.titleImageUrl,
    this.rating,
    this.price,
    this.imageUrls,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.description,
        this.titleImageUrl,
        this.rating,
        this.price,
        this.imageUrls,
      ];
  @override
  bool? get stringify => true;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

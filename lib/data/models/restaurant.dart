import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

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
  final bool? visible;
  final List<String>? imageUrls;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.titleImageUrl,
    this.rating,
    this.price,
    this.imageUrls,
    this.visible,
  });

  Restaurant.uid({
    this.name,
    this.description,
    this.titleImageUrl,
    this.rating,
    this.price,
    this.imageUrls,
    this.visible,
  }) : id = Uuid().v4();

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.description,
        this.titleImageUrl,
        this.rating,
        this.price,
        this.imageUrls,
        this.visible,
      ];
  @override
  bool? get stringify => true;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

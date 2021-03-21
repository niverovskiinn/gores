import 'package:equatable/equatable.dart';
import 'package:gores/data/models/restaurant_tables.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'price.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? address;
  final String? titleImageUrl;
  final double? rating;
  final Price? price;
  final bool? visible;
  final List<String>? imageUrls;
  final List<RestaurantTables>? tables;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.address,
    this.titleImageUrl,
    this.rating,
    this.price,
    this.imageUrls,
    this.visible,
    this.tables,
  });

  Restaurant.uid({
    this.name,
    this.description,
    this.titleImageUrl,
    this.address,
    this.rating,
    this.price,
    this.imageUrls,
    this.visible,
    this.tables,
  }) : id = Uuid().v4();

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.description,
        this.address,
        this.titleImageUrl,
        this.rating,
        this.price,
        this.imageUrls,
        this.visible,
        this.tables,
      ];
  @override
  bool? get stringify => true;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

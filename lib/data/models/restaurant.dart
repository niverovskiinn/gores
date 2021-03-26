import 'package:equatable/equatable.dart';
import 'package:gores/data/models/reservation.dart';
import 'package:gores/data/models/restaurant_tables.dart';
import 'package:uuid/uuid.dart';

import 'price.dart';

part 'restaurant.json.dart';

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
  final DateTime? created;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.titleImageUrl,
      this.rating,
      this.price,
      this.imageUrls,
      this.visible,
      this.tables,
      this.created});

  Restaurant.uid(
      {this.name,
      this.description,
      this.titleImageUrl,
      this.address,
      this.rating,
      this.price,
      this.imageUrls,
      this.visible,
      this.tables,
      this.created})
      : id = Uuid().v4();

  List<String?> get imagesAll =>
      (titleImageUrl != null ? [titleImageUrl!] : <String>[]) +
      (imageUrls ?? []);
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
        this.created,
      ];

  @override
  bool? get stringify => true;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

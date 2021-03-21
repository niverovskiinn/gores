import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_tables.g.dart';

@JsonSerializable()
class RestaurantTables with EquatableMixin {
  int? capacity;
  int? amount;

  RestaurantTables({
    this.capacity,
    this.amount,
  });

  @override
  List<Object?> get props => [
        this.capacity,
        this.amount,
      ];
  @override
  bool? get stringify => true;
  factory RestaurantTables.fromJson(Map<String, dynamic> json) =>
      _$RestaurantTablesFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantTablesToJson(this);
}

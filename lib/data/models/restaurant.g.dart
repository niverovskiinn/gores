// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    address: json['address'] as String?,
    titleImageUrl: json['titleImageUrl'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
    price: _$enumDecodeNullable(_$PriceEnumMap, json['price']),
    imageUrls:
        (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    visible: json['visible'] as bool?,
    tables: (json['tables'] as List<dynamic>?)
        ?.map((e) => RestaurantTables.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'titleImageUrl': instance.titleImageUrl,
      'rating': instance.rating,
      'price': _$PriceEnumMap[instance.price],
      'visible': instance.visible,
      'imageUrls': instance.imageUrls,
      'tables': instance.tables,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PriceEnumMap = {
  Price.low: 'low',
  Price.medium: 'medium',
  Price.high: 'high',
  Price.cosmos: 'cosmos',
};

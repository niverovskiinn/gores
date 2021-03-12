// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$_$_RestaurantFromJson(Map<String, dynamic> json) {
  return _$_Restaurant(
    id: json['id'] as String,
    name: json['name'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    description: json['description'] as String,
    titleImageUrl: json['titleImageUrl'] as String,
    imageUrls: (json['imageUrls'] as List)?.map((e) => e as String)?.toList(),
    price: _$enumDecodeNullable(_$PriceEnumMap, json['price']),
  );
}

Map<String, dynamic> _$_$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'description': instance.description,
      'titleImageUrl': instance.titleImageUrl,
      'imageUrls': instance.imageUrls,
      'price': _$PriceEnumMap[instance.price],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PriceEnumMap = {
  Price.low: 'low',
  Price.medium: 'medium',
  Price.high: 'high',
  Price.cosmos: 'cosmos',
};

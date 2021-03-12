// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
class _$RestaurantTearOff {
  const _$RestaurantTearOff();

// ignore: unused_element
  _Restaurant call(
      {String id,
      String name,
      double rating,
      String description,
      String titleImageUrl,
      List<String> imageUrls,
      Price price}) {
    return _Restaurant(
      id: id,
      name: name,
      rating: rating,
      description: description,
      titleImageUrl: titleImageUrl,
      imageUrls: imageUrls,
      price: price,
    );
  }

// ignore: unused_element
  Restaurant fromJson(Map<String, Object> json) {
    return Restaurant.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Restaurant = _$RestaurantTearOff();

/// @nodoc
mixin _$Restaurant {
  String get id;
  String get name;
  double get rating;
  String get description;
  String get titleImageUrl;
  List<String> get imageUrls;
  Price get price;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      double rating,
      String description,
      String titleImageUrl,
      List<String> imageUrls,
      Price price});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res> implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  final Restaurant _value;
  // ignore: unused_field
  final $Res Function(Restaurant) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object rating = freezed,
    Object description = freezed,
    Object titleImageUrl = freezed,
    Object imageUrls = freezed,
    Object price = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      rating: rating == freezed ? _value.rating : rating as double,
      description:
          description == freezed ? _value.description : description as String,
      titleImageUrl: titleImageUrl == freezed
          ? _value.titleImageUrl
          : titleImageUrl as String,
      imageUrls:
          imageUrls == freezed ? _value.imageUrls : imageUrls as List<String>,
      price: price == freezed ? _value.price : price as Price,
    ));
  }
}

/// @nodoc
abstract class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(
          _Restaurant value, $Res Function(_Restaurant) then) =
      __$RestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      double rating,
      String description,
      String titleImageUrl,
      List<String> imageUrls,
      Price price});
}

/// @nodoc
class __$RestaurantCopyWithImpl<$Res> extends _$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(
      _Restaurant _value, $Res Function(_Restaurant) _then)
      : super(_value, (v) => _then(v as _Restaurant));

  @override
  _Restaurant get _value => super._value as _Restaurant;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object rating = freezed,
    Object description = freezed,
    Object titleImageUrl = freezed,
    Object imageUrls = freezed,
    Object price = freezed,
  }) {
    return _then(_Restaurant(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      rating: rating == freezed ? _value.rating : rating as double,
      description:
          description == freezed ? _value.description : description as String,
      titleImageUrl: titleImageUrl == freezed
          ? _value.titleImageUrl
          : titleImageUrl as String,
      imageUrls:
          imageUrls == freezed ? _value.imageUrls : imageUrls as List<String>,
      price: price == freezed ? _value.price : price as Price,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Restaurant implements _Restaurant {
  _$_Restaurant(
      {this.id,
      this.name,
      this.rating,
      this.description,
      this.titleImageUrl,
      this.imageUrls,
      this.price});

  factory _$_Restaurant.fromJson(Map<String, dynamic> json) =>
      _$_$_RestaurantFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double rating;
  @override
  final String description;
  @override
  final String titleImageUrl;
  @override
  final List<String> imageUrls;
  @override
  final Price price;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, rating: $rating, description: $description, titleImageUrl: $titleImageUrl, imageUrls: $imageUrls, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Restaurant &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.titleImageUrl, titleImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.titleImageUrl, titleImageUrl)) &&
            (identical(other.imageUrls, imageUrls) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrls, imageUrls)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(titleImageUrl) ^
      const DeepCollectionEquality().hash(imageUrls) ^
      const DeepCollectionEquality().hash(price);

  @JsonKey(ignore: true)
  @override
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestaurantToJson(this);
  }
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(
      {String id,
      String name,
      double rating,
      String description,
      String titleImageUrl,
      List<String> imageUrls,
      Price price}) = _$_Restaurant;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$_Restaurant.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get rating;
  @override
  String get description;
  @override
  String get titleImageUrl;
  @override
  List<String> get imageUrls;
  @override
  Price get price;
  @override
  @JsonKey(ignore: true)
  _$RestaurantCopyWith<_Restaurant> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

// ignore: unused_element
  _Profile call({String id, String name, String phone, String email}) {
    return _Profile(
      id: id,
      name: name,
      phone: phone,
      email: email,
    );
  }

// ignore: unused_element
  Profile fromJson(Map<String, Object> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  String get id;
  String get name;
  String get phone;
  String get email;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call({String id, String name, String phone, String email});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

/// @nodoc
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String phone, String email});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object phone = freezed,
    Object email = freezed,
  }) {
    return _then(_Profile(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      phone: phone == freezed ? _value.phone : phone as String,
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Profile implements _Profile {
  _$_Profile({this.id, this.name, this.phone, this.email});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$_$_ProfileFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Profile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProfileToJson(this);
  }
}

abstract class _Profile implements Profile {
  factory _Profile({String id, String name, String phone, String email}) =
      _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith;
}

import 'package:equatable/equatable.dart';
import 'package:gores/data/models/roles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile extends Equatable {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final Roles? role;

  Profile({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.role,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.phone,
        this.email,
        this.role,
      ];

  @override
  bool? get stringify => true;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  bool get isEmpty => id != null && name != null;
}

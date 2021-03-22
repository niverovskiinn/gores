import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

@JsonSerializable()
class Reservation extends Equatable {
  final DateTime? date;
  final List<MeetingEvent>? events;

  Reservation({this.date, this.events});

  @override
  List<Object?> get props => [this.date, this.events];

  @override
  bool? get stringify => true;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}

@JsonSerializable()
class MeetingEvent extends Equatable {
  final String? clientPhone;
  final DateTime? time;
  final int? tablePlaces;
  final DateTime? finishedTime;

  MeetingEvent({
    this.time,
    this.tablePlaces,
    this.finishedTime,
    this.clientPhone,
  });

  @override
  List<Object?> get props => [
        this.time,
        this.tablePlaces,
        this.finishedTime,
        this.clientPhone,
      ];

  @override
  bool? get stringify => true;

  factory MeetingEvent.fromJson(Map<String, dynamic> json) =>
      _$MeetingEventFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingEventToJson(this);
}

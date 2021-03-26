import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

class TimeSerialiser implements JsonConverter<TimeOfDay?, String> {
  const TimeSerialiser();

  @override
  TimeOfDay fromJson(String json) => TimeOfDay(
      hour: int.parse(json.substring(0, 2)),
      minute: int.parse(json.substring(3)));

  @override
  String toJson(TimeOfDay? time) =>
      "${_addZero(time!.hour)}:${_addZero(time.minute)}";

  String _addZero(int val) {
    if (val > 9) {
      return val.toString();
    } else {
      return "0$val";
    }
  }
}

@JsonSerializable()
class Reservation extends Equatable {
  final Date? date;
  final String? clientPhone;
  @TimeSerialiser()
  final TimeOfDay? beginTime;
  final int? tablePlaces;
  @TimeSerialiser()
  final TimeOfDay? finishedTime;
  final String? restId;

  Reservation({
    this.date,
    this.beginTime,
    this.tablePlaces,
    this.finishedTime,
    this.clientPhone,
    this.restId,
  });

  @override
  List<Object?> get props => [
        this.date,
        this.beginTime,
        this.tablePlaces,
        this.finishedTime,
        this.clientPhone,
        this.restId,
      ];

  @override
  bool? get stringify => true;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationToJson(this);
}

class Date extends Equatable {
  final int? year;
  final int? month;
  final int? day;

  Date({
    this.year,
    this.month,
    this.day,
  });

  factory Date.fromDateTime(DateTime dateTime) => Date(
        day: dateTime.day,
        month: dateTime.month,
        year: dateTime.year,
      );

  @override
  List<Object?> get props => [
        this.year,
        this.month,
        this.day,
      ];
  String _addZero(int val) {
    if (val > 9) {
      return val.toString();
    } else {
      return "0$val";
    }
  }

  @override
  String toString() {
    return toJson();
  }

  @override
  bool? get stringify => true;

  factory Date.fromJson(String json) => Date(
        day: int.parse(json.substring(0, 2)),
        month: int.parse(json.substring(3, 5)),
        year: int.parse(json.substring(6)),
      );
  String toJson() => "${_addZero(day!)}.${_addZero(month!)}.$year";
}

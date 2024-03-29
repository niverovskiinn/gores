import 'package:flutter/material.dart';

extension Operations on TimeOfDay {
  bool isAfter(TimeOfDay another) =>
      hour > another.hour || hour == another.hour && minute > another.minute;

  bool isBefore(TimeOfDay another) => !isAfter(another) && this != another;

  TimeOfDay add([int hours = 0, int minutes = 0]) => TimeOfDay(
        hour: hour + hours,
        minute: minute + minutes,
      );
  String toFormattedString() {
    return "${_addZero(hour)}:${_addZero(minute)}";
  }

  String _addZero(int val) {
    if (val > 9) {
      return val.toString();
    } else {
      return "0$val";
    }
  }
}

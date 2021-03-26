// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return Reservation(
    date: json['date'] == null ? null : Date.fromJson(json['date'] as String),
    beginTime: const TimeSerialiser().fromJson(json['beginTime'] as String),
    tablePlaces: json['tablePlaces'] as int?,
    finishedTime:
        const TimeSerialiser().fromJson(json['finishedTime'] as String),
    clientPhone: json['clientPhone'] as String?,
    restId: json['restId'] as String?,
  );
}

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'date': instance.date?.toJson(),
      'clientPhone': instance.clientPhone,
      'beginTime': const TimeSerialiser().toJson(instance.beginTime),
      'tablePlaces': instance.tablePlaces,
      'restId': instance.restId,
      'finishedTime': const TimeSerialiser().toJson(instance.finishedTime),
    };

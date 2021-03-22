// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return Reservation(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    events: (json['events'] as List<dynamic>?)
        ?.map((e) => MeetingEvent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'events': instance.events,
    };

MeetingEvent _$MeetingEventFromJson(Map<String, dynamic> json) {
  return MeetingEvent(
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    tablePlaces: json['tablePlaces'] as int?,
    finishedTime: json['finishedTime'] == null
        ? null
        : DateTime.parse(json['finishedTime'] as String),
    clientPhone: json['clientPhone'] as String?,
  );
}

Map<String, dynamic> _$MeetingEventToJson(MeetingEvent instance) =>
    <String, dynamic>{
      'clientPhone': instance.clientPhone,
      'time': instance.time?.toIso8601String(),
      'tablePlaces': instance.tablePlaces,
      'finishedTime': instance.finishedTime?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryList _$HistoryListFromJson(Map<String, dynamic> json) {
  return HistoryList(
      histories: (json['histories'] as List)
          ?.map((e) =>
              e == null ? null : History.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HistoryListToJson(HistoryList instance) =>
    <String, dynamic>{'histories': instance.histories};

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
      details: json['details'] as String,
      links: (json['links'] as List)
          ?.map((e) =>
              e == null ? null : Links.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      title: json['title'] as String,
      time: json['event_date_utc'] as String,
      flightNumber: json['flight_number'] as int);
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'title': instance.title,
      'event_date_utc': instance.time,
      'details': instance.details,
      'flight_number': instance.flightNumber,
      'links': instance.links
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
      article: json['article'] as String,
      wikipedia: json['wikipedia'] as String);
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'article': instance.article,
      'wikipedia': instance.wikipedia
    };

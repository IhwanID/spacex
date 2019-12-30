import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class HistoryList {
  HistoryList({this.histories});

  final List<History> histories;
  factory HistoryList.fromJson(List<dynamic> parsedJson) {
    List<History> histories = new List<History>();
    histories = parsedJson.map((i) => History.fromJson(i)).toList();

    return new HistoryList(histories: histories);
  }
}

@JsonSerializable()
class History {
  History({this.details, this.links, this.title, this.time, this.flightNumber});

  final String title;
  @JsonKey(name: 'event_date_utc')
  final String time;
  final String details;
  @JsonKey(name: 'flight_number')
  final int flightNumber;
  final List<Links> links;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable()
class Links {
  Links({this.article, this.wikipedia});
  final String article;
  final String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

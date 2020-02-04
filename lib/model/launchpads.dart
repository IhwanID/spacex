import 'package:json_annotation/json_annotation.dart';

part 'launchpads.g.dart';

@JsonSerializable()
class LaunchpadsList {
  LaunchpadsList({this.launchpads});

  final List<Launchpads> launchpads;
  factory LaunchpadsList.fromJson(List<dynamic> parsedJson) {
    List<Launchpads> launchpads = new List<Launchpads>();
    launchpads = parsedJson.map((i) => Launchpads.fromJson(i)).toList();

    return new LaunchpadsList(launchpads: launchpads);
  }
}

@JsonSerializable()
class Launchpads {
  Launchpads({this.name, this.status, this.wikipedia, this.details, this.siteId, this.siteNameLong});

  final String name;
  final String status;
  final String wikipedia;
  final String details;
  @JsonKey(name: 'site_id')
  final String siteId;
  @JsonKey(name: 'site_name_long')
  final String siteNameLong;

  factory Launchpads.fromJson(Map<String, dynamic> json) =>
      _$LaunchpadsFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchpadsToJson(this);
}


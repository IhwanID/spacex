import 'package:json_annotation/json_annotation.dart';

part 'missions.g.dart';

@JsonSerializable()
class MissionsList {
  MissionsList({this.landpads});

  final List<Missions> landpads;
  factory MissionsList.fromJson(List<dynamic> parsedJson) {
    List<Missions> landpads = new List<Missions>();
    landpads = parsedJson.map((i) => Missions.fromJson(i)).toList();

    return new MissionsList(landpads: landpads);
  }
}

@JsonSerializable()
class Missions {
  Missions(
      {this.name, this.description, this.status, this.website, this.wikipedia});

  @JsonKey(name: 'mission_name')
  final String name;
  final String description;
  final String status;
  @JsonKey(name: 'landing_type')
  final String website;
  final String wikipedia;

  factory Missions.fromJson(Map<String, dynamic> json) =>
      _$MissionsFromJson(json);
  Map<String, dynamic> toJson() => _$MissionsToJson(this);
}

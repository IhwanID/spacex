import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
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

Future<MissionsList> getAllMissions() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/landpads';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return MissionsList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

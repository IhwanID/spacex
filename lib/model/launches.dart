import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'launches.g.dart';

@JsonSerializable()
class LaunchesList {
  LaunchesList({this.launches});

  final List<Launches> launches;
  factory LaunchesList.fromJson(List<dynamic> parsedJson) {
    List<Launches> launches = new List<Launches>();
    launches = parsedJson.map((i) => Launches.fromJson(i)).toList();

    return new LaunchesList(launches: launches);
  }
}

@JsonSerializable()
class Launches {
  Launches({this.name, this.details, this.links});

  @JsonKey(name: 'mission_name')
  final String name;
  final String details;
  final Links links;

  factory Launches.fromJson(Map<String, dynamic> json) =>
      _$LaunchesFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchesToJson(this);
}

@JsonSerializable()
class Links {
  Links({this.patch, this.article, this.video, this.wikipedia});

  @JsonKey(name: 'mission_patch')
  final String patch;
  @JsonKey(name: 'article_link')
  final String article;
  @JsonKey(name: 'video_link')
  final String video;
  final String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

Future<LaunchesList> getAllLaunches() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/launches';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return LaunchesList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

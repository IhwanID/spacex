import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'rockets.g.dart';

@JsonSerializable()
class RocketsList {
  RocketsList({this.rockets});

  final List<Rockets> rockets;
  factory RocketsList.fromJson(List<dynamic> parsedJson) {
    List<Rockets> rockets = new List<Rockets>();
    rockets = parsedJson.map((i) => Rockets.fromJson(i)).toList();

    return new RocketsList(rockets: rockets);
  }
}

@JsonSerializable()
class Rockets {
  Rockets({this.name, this.description, this.wikipedia, this.images});

  @JsonKey(name: 'rocket_name')
  final String name;
  final String description;
  final String wikipedia;
  @JsonKey(name: 'flickr_images')
  final List<String> images;
  factory Rockets.fromJson(Map<String, dynamic> json) =>
      _$RocketsFromJson(json);
  Map<String, dynamic> toJson() => _$RocketsToJson(this);
}

Future<RocketsList> getAllRockets() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/rockets';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return RocketsList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

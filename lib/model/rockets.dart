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

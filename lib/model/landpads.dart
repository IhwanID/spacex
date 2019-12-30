import 'package:json_annotation/json_annotation.dart';

part 'landpads.g.dart';

@JsonSerializable()
class LandpadsList {
  LandpadsList({this.landpads});

  final List<Landpads> landpads;
  factory LandpadsList.fromJson(List<dynamic> parsedJson) {
    List<Landpads> landpads = new List<Landpads>();
    landpads = parsedJson.map((i) => Landpads.fromJson(i)).toList();

    return new LandpadsList(landpads: landpads);
  }
}

@JsonSerializable()
class Landpads {
  Landpads(
      {this.name,
      this.details,
      this.status,
      this.type,
      this.wikipedia,
      this.location});

  @JsonKey(name: 'full_name')
  final String name;
  final String details;
  final String status;
  @JsonKey(name: 'landing_type')
  final String type;
  final String wikipedia;
  final Location location;

  factory Landpads.fromJson(Map<String, dynamic> json) =>
      _$LandpadsFromJson(json);
  Map<String, dynamic> toJson() => _$LandpadsToJson(this);
}

@JsonSerializable()
class Location {
  Location({this.name, this.region, this.longitude, this.latitude});
  final String name;
  final String region;
  final int latitude;
  final int longitude;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

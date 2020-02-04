import 'package:json_annotation/json_annotation.dart';

part 'roadster.g.dart';

@JsonSerializable()
class Roadster {
  Roadster({this.name, this.wikipedia, this.details, this.images});

  final String name;
  final String wikipedia;
  final String details;
  @JsonKey(name: 'flickr_images')
  final List<String> images;

  factory Roadster.fromJson(Map<String, dynamic> json) =>
      _$RoadsterFromJson(json);
  Map<String, dynamic> toJson() => _$RoadsterToJson(this);
}

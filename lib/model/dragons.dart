import 'package:json_annotation/json_annotation.dart';

part 'dragons.g.dart';

@JsonSerializable()
class DragonsList {
  DragonsList({this.dragons});

  final List<Dragons> dragons;
  factory DragonsList.fromJson(List<dynamic> parsedJson) {
    List<Dragons> dragons = new List<Dragons>();
    dragons = parsedJson.map((i) => Dragons.fromJson(i)).toList();

    return new DragonsList(dragons: dragons);
  }
}

@JsonSerializable()
class Dragons {
  Dragons({this.id, this.name, this.description, this.wikipedia, this.images});

  final String id;
  final String name;
  final String description;
  final String wikipedia;
  @JsonKey(name: 'flickr_images')
  final List<String> images;
  factory Dragons.fromJson(Map<String, dynamic> json) =>
      _$DragonsFromJson(json);
  Map<String, dynamic> toJson() => _$DragonsToJson(this);
}

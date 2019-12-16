import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
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

Future<DragonsList> getAllDragon() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/dragons';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return DragonsList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

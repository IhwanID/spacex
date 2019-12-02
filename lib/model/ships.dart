import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'ships.g.dart';

@JsonSerializable()
class ShipsList {
  ShipsList({this.landpads});

  final List<Ships> landpads;
  factory ShipsList.fromJson(List<dynamic> parsedJson) {
    List<Ships> landpads = new List<Ships>();
    landpads = parsedJson.map((i) => Ships.fromJson(i)).toList();

    return new ShipsList(landpads: landpads);
  }
}

@JsonSerializable()
class Ships {
  Ships({this.name, this.model, this.type, this.image});

  @JsonKey(name: 'ship_name')
  final String name;
  @JsonKey(name: 'ship_model')
  final String model;
  @JsonKey(name: 'ship_type')
  final String type;
  final String image;

  factory Ships.fromJson(Map<String, dynamic> json) => _$ShipsFromJson(json);
  Map<String, dynamic> toJson() => _$ShipsToJson(this);
}

Future<ShipsList> getAllShips() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/ships';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return ShipsList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info {
  Info(
      {this.name,
      this.founded,
      this.summary,
      this.founder,
      this.valuation,
      this.employees,
      this.headquarters});

  final String name;
  final String founder;
  final String summary;
  final int founded;
  final int employees;
  final int valuation;
  final Headquarters headquarters;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Headquarters {
  Headquarters({this.city, this.address, this.state});

  final String address;
  final String city;
  final String state;
  factory Headquarters.fromJson(Map<String, dynamic> json) =>
      _$HeadquartersFromJson(json);
  Map<String, dynamic> toJson() => _$HeadquartersToJson(this);
}

@JsonSerializable()
class Links {
  Links({this.website, this.flickr, this.twitter});

  final String website;
  final String flickr;
  final String twitter;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

Future<Info> getInfo() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/info';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return Info.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

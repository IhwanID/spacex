import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'capsules.g.dart';

@JsonSerializable()
class CapsulesList {
  CapsulesList({this.capsules});

  final List<Capsules> capsules;
  factory CapsulesList.fromJson(List<dynamic> parsedJson) {
    List<Capsules> capsules = new List<Capsules>();
    capsules = parsedJson.map((i) => Capsules.fromJson(i)).toList();

    return new CapsulesList(capsules: capsules);
  }
}

@JsonSerializable()
class Capsules {
  Capsules(
      {this.serial,
      this.details,
      this.status,
      this.original,
      this.type,
      this.missions});

  @JsonKey(name: 'capsule_serial')
  final String serial;
  final String details;
  final String status;
  @JsonKey(name: 'original_launch')
  final String original;
  final String type;
  final List<Missions> missions;

  factory Capsules.fromJson(Map<String, dynamic> json) =>
      _$CapsulesFromJson(json);
  Map<String, dynamic> toJson() => _$CapsulesToJson(this);
}

@JsonSerializable()
class Missions {
  Missions({this.name, this.flight});
  final String name;
  final int flight;

  factory Missions.fromJson(Map<String, dynamic> json) =>
      _$MissionsFromJson(json);
  Map<String, dynamic> toJson() => _$MissionsToJson(this);
}

Future<CapsulesList> getAllCapsules() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/capsules';

  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return CapsulesList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

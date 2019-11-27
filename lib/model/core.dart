import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'core.g.dart';

@JsonSerializable()
class CoresList {
  CoresList({this.cores});

  final List<Cores> cores;
//  factory CoresList.fromJson(Map<String, dynamic> json) => _$CoresListFromJson(json);
//  Map<String, dynamic> toJson() => _$CoresListToJson(this);
  factory CoresList.fromJson(List<dynamic> parsedJson) {
    List<Cores> cores = new List<Cores>();
    cores = parsedJson.map((i) => Cores.fromJson(i)).toList();

    return new CoresList(cores: cores);
  }
}

@JsonSerializable()
class Cores {
  Cores({this.serial, this.details});

  @JsonKey(name: 'core_serial')
  final String serial;
  final String details;
  factory Cores.fromJson(Map<String, dynamic> json) => _$CoresFromJson(json);
  Map<String, dynamic> toJson() => _$CoresToJson(this);
}

Future<CoresList> getAllCore() async {
  const spacexCoreUrl = 'https://api.spacexdata.com/v3/cores';

  // Retrieve the locations of Google offices
  final response = await http.get(spacexCoreUrl);
  if (response.statusCode == 200) {
    return CoresList.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(spacexCoreUrl));
  }
}

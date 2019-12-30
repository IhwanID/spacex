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

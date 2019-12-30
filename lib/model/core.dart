import 'package:json_annotation/json_annotation.dart';

part 'core.g.dart';

@JsonSerializable()
class CoresList {
  CoresList({this.cores});

  final List<Cores> cores;
  factory CoresList.fromJson(List<dynamic> parsedJson) {
    List<Cores> cores = new List<Cores>();
    cores = parsedJson.map((i) => Cores.fromJson(i)).toList();

    return new CoresList(cores: cores);
  }
}

@JsonSerializable()
class Cores {
  Cores({this.serial, this.details, this.status});

  @JsonKey(name: 'core_serial')
  final String serial;
  final String details;
  final String status;
  factory Cores.fromJson(Map<String, dynamic> json) => _$CoresFromJson(json);
  Map<String, dynamic> toJson() => _$CoresToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'payloads.g.dart';

@JsonSerializable()
class PayloadsList {
  PayloadsList({this.payloads});

  final List<Payloads> payloads;
  factory PayloadsList.fromJson(List<dynamic> parsedJson) {
    List<Payloads> payloads = new List<Payloads>();
    payloads = parsedJson.map((i) => Payloads.fromJson(i)).toList();

    return new PayloadsList(payloads: payloads);
  }
}

@JsonSerializable()
class Payloads {
  Payloads({this.type, this.id, this.nationality, this.manufacturer});

  @JsonKey(name: 'payload_type')
  final String type;
  @JsonKey(name: 'payload_id')
  final String id;
  final String nationality;
  final String manufacturer;
  factory Payloads.fromJson(Map<String, dynamic> json) =>
      _$PayloadsFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadsToJson(this);
}

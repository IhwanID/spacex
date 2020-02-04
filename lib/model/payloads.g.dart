// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayloadsList _$PayloadsListFromJson(Map<String, dynamic> json) {
  return PayloadsList(
      payloads: (json['payloads'] as List)
          ?.map((e) =>
              e == null ? null : Payloads.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PayloadsListToJson(PayloadsList instance) =>
    <String, dynamic>{'payloads': instance.payloads};

Payloads _$PayloadsFromJson(Map<String, dynamic> json) {
  return Payloads(
      type: json['payload_type'] as String,
      id: json['payload_id'] as String,
      nationality: json['nationality'] as String,
      manufacturer: json['manufacturer'] as String);
}

Map<String, dynamic> _$PayloadsToJson(Payloads instance) => <String, dynamic>{
      'payload_type': instance.type,
      'payload_id': instance.id,
      'nationality': instance.nationality,
      'manufacturer': instance.manufacturer
    };

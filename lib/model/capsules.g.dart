// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capsules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CapsulesList _$CapsulesListFromJson(Map<String, dynamic> json) {
  return CapsulesList(
      capsules: (json['capsules'] as List)
          ?.map((e) =>
              e == null ? null : Capsules.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CapsulesListToJson(CapsulesList instance) =>
    <String, dynamic>{'capsules': instance.capsules};

Capsules _$CapsulesFromJson(Map<String, dynamic> json) {
  return Capsules(
      serial: json['capsule_serial'] as String,
      details: json['details'] as String,
      status: json['status'] as String,
      original: json['original_launch'] as String,
      type: json['type'] as String,
      missions: (json['missions'] as List)
          ?.map((e) =>
              e == null ? null : Missions.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CapsulesToJson(Capsules instance) => <String, dynamic>{
      'capsule_serial': instance.serial,
      'details': instance.details,
      'status': instance.status,
      'original_launch': instance.original,
      'type': instance.type,
      'missions': instance.missions
    };

Missions _$MissionsFromJson(Map<String, dynamic> json) {
  return Missions(name: json['name'] as String, flight: json['flight'] as int);
}

Map<String, dynamic> _$MissionsToJson(Missions instance) =>
    <String, dynamic>{'name': instance.name, 'flight': instance.flight};

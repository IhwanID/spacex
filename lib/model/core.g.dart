// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoresList _$CoresListFromJson(Map<String, dynamic> json) {
  return CoresList(
      cores: (json['cores'] as List)
          ?.map((e) =>
              e == null ? null : Cores.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CoresListToJson(CoresList instance) =>
    <String, dynamic>{'cores': instance.cores};

Cores _$CoresFromJson(Map<String, dynamic> json) {
  return Cores(
      serial: json['core_serial'] as String,
      details: json['details'] as String);
}

Map<String, dynamic> _$CoresToJson(Cores instance) => <String, dynamic>{
      'core_serial': instance.serial,
      'details': instance.details
    };

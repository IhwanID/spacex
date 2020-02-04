// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launchpads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchpadsList _$LaunchpadsListFromJson(Map<String, dynamic> json) {
  return LaunchpadsList(
      launchpads: (json['launchpads'] as List)
          ?.map((e) =>
              e == null ? null : Launchpads.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LaunchpadsListToJson(LaunchpadsList instance) =>
    <String, dynamic>{'launchpads': instance.launchpads};

Launchpads _$LaunchpadsFromJson(Map<String, dynamic> json) {
  return Launchpads(
      name: json['name'] as String,
      status: json['status'] as String,
      wikipedia: json['wikipedia'] as String,
      details: json['details'] as String,
      siteId: json['site_id'] as String,
      siteNameLong: json['site_name_long'] as String);
}

Map<String, dynamic> _$LaunchpadsToJson(Launchpads instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'wikipedia': instance.wikipedia,
      'details': instance.details,
      'site_id': instance.siteId,
      'site_name_long': instance.siteNameLong
    };

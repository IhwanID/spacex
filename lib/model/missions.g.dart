// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionsList _$MissionsListFromJson(Map<String, dynamic> json) {
  return MissionsList(
      landpads: (json['landpads'] as List)
          ?.map((e) =>
              e == null ? null : Missions.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MissionsListToJson(MissionsList instance) =>
    <String, dynamic>{'landpads': instance.landpads};

Missions _$MissionsFromJson(Map<String, dynamic> json) {
  return Missions(
      name: json['mission_name'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      website: json['landing_type'] as String,
      wikipedia: json['wikipedia'] as String);
}

Map<String, dynamic> _$MissionsToJson(Missions instance) => <String, dynamic>{
      'mission_name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'landing_type': instance.website,
      'wikipedia': instance.wikipedia
    };

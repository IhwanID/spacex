// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landpads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandpadsList _$LandpadsListFromJson(Map<String, dynamic> json) {
  return LandpadsList(
      landpads: (json['landpads'] as List)
          ?.map((e) =>
              e == null ? null : Landpads.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LandpadsListToJson(LandpadsList instance) =>
    <String, dynamic>{'landpads': instance.landpads};

Landpads _$LandpadsFromJson(Map<String, dynamic> json) {
  return Landpads(
      name: json['full_name'] as String,
      details: json['details'] as String,
      status: json['status'] as String,
      type: json['landing_type'] as String,
      wikipedia: json['wikipedia'] as String,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LandpadsToJson(Landpads instance) => <String, dynamic>{
      'full_name': instance.name,
      'details': instance.details,
      'status': instance.status,
      'landing_type': instance.type,
      'wikipedia': instance.wikipedia,
      'location': instance.location
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      name: json['name'] as String,
      region: json['region'] as String,
      longitude: json['longitude'] as int,
      latitude: json['latitude'] as int);
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };

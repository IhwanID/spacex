// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Roadster _$RoadsterFromJson(Map<String, dynamic> json) {
  return Roadster(
      name: json['name'] as String,
      wikipedia: json['wikipedia'] as String,
      details: json['details'] as String,
      images:
          (json['flickr_images'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$RoadsterToJson(Roadster instance) => <String, dynamic>{
      'name': instance.name,
      'wikipedia': instance.wikipedia,
      'details': instance.details,
      'flickr_images': instance.images
    };

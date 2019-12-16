// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rockets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketsList _$RocketsListFromJson(Map<String, dynamic> json) {
  return RocketsList(
      rockets: (json['rockets'] as List)
          ?.map((e) =>
              e == null ? null : Rockets.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$RocketsListToJson(RocketsList instance) =>
    <String, dynamic>{'rockets': instance.rockets};

Rockets _$RocketsFromJson(Map<String, dynamic> json) {
  return Rockets(
      name: json['rocket_name'] as String,
      description: json['description'] as String,
      wikipedia: json['wikipedia'] as String,
      images:
          (json['flickr_images'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$RocketsToJson(Rockets instance) => <String, dynamic>{
      'rocket_name': instance.name,
      'description': instance.description,
      'wikipedia': instance.wikipedia,
      'flickr_images': instance.images
    };

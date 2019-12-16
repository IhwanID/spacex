// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchesList _$LaunchesListFromJson(Map<String, dynamic> json) {
  return LaunchesList(
      launches: (json['launches'] as List)
          ?.map((e) =>
              e == null ? null : Launches.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LaunchesListToJson(LaunchesList instance) =>
    <String, dynamic>{'launches': instance.launches};

Launches _$LaunchesFromJson(Map<String, dynamic> json) {
  return Launches(
      name: json['mission_name'] as String,
      details: json['details'] as String,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LaunchesToJson(Launches instance) => <String, dynamic>{
      'mission_name': instance.name,
      'details': instance.details,
      'links': instance.links
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
      patch: json['mission_patch'] as String,
      article: json['article_link'] as String,
      video: json['video_link'] as String,
      wikipedia: json['wikipedia'] as String);
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'mission_patch': instance.patch,
      'article_link': instance.article,
      'video_link': instance.video,
      'wikipedia': instance.wikipedia
    };

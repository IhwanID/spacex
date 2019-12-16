// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DragonsList _$DragonsListFromJson(Map<String, dynamic> json) {
  return DragonsList(
      dragons: (json['dragons'] as List)
          ?.map((e) =>
              e == null ? null : Dragons.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DragonsListToJson(DragonsList instance) =>
    <String, dynamic>{'dragons': instance.dragons};

Dragons _$DragonsFromJson(Map<String, dynamic> json) {
  return Dragons(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      wikipedia: json['wikipedia'] as String,
      images:
          (json['flickr_images'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$DragonsToJson(Dragons instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'wikipedia': instance.wikipedia,
      'flickr_images': instance.images
    };

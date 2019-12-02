// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipsList _$ShipsListFromJson(Map<String, dynamic> json) {
  return ShipsList(
      landpads: (json['landpads'] as List)
          ?.map((e) =>
              e == null ? null : Ships.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ShipsListToJson(ShipsList instance) =>
    <String, dynamic>{'landpads': instance.landpads};

Ships _$ShipsFromJson(Map<String, dynamic> json) {
  return Ships(
      name: json['ship_name'] as String,
      model: json['ship_model'] as String,
      type: json['ship_type'] as String,
      image: json['image'] as String);
}

Map<String, dynamic> _$ShipsToJson(Ships instance) => <String, dynamic>{
      'ship_name': instance.name,
      'ship_model': instance.model,
      'ship_type': instance.type,
      'image': instance.image
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
      name: json['name'] as String,
      founded: json['founded'] as int,
      summary: json['summary'] as String,
      founder: json['founder'] as String,
      valuation: json['valuation'] as int,
      employees: json['employees'] as int,
      headquarters: json['headquarters'] == null
          ? null
          : Headquarters.fromJson(
              json['headquarters'] as Map<String, dynamic>));
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'name': instance.name,
      'founder': instance.founder,
      'summary': instance.summary,
      'founded': instance.founded,
      'employees': instance.employees,
      'valuation': instance.valuation,
      'headquarters': instance.headquarters
    };

Headquarters _$HeadquartersFromJson(Map<String, dynamic> json) {
  return Headquarters(
      city: json['city'] as String,
      address: json['address'] as String,
      state: json['state'] as String);
}

Map<String, dynamic> _$HeadquartersToJson(Headquarters instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
      website: json['website'] as String,
      flickr: json['flickr'] as String,
      twitter: json['twitter'] as String);
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'website': instance.website,
      'flickr': instance.flickr,
      'twitter': instance.twitter
    };

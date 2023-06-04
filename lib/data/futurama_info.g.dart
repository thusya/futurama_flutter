// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'futurama_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuturamaInfo _$FuturamaInfoFromJson(Map<String, dynamic> json) => FuturamaInfo(
      synopsis: json['synopsis'] as String,
      yearsAired: json['yearsAired'] as String,
      creators: (json['creators'] as List<dynamic>)
          .map((e) => FuturamaInfoCreator.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$FuturamaInfoToJson(FuturamaInfo instance) =>
    <String, dynamic>{
      'synopsis': instance.synopsis,
      'yearsAired': instance.yearsAired,
      'id': instance.id,
      'creators': instance.creators,
    };

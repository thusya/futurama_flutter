// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'futurama_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuturamaCharacter _$FuturamaCharacterFromJson(Map<String, dynamic> json) =>
    FuturamaCharacter(
      name: FuturamaName.fromJson(json['name'] as Map<String, dynamic>),
      images: FuturamaImages.fromJson(json['images'] as Map<String, dynamic>),
      gender: json['gender'] as String,
      species: json['species'] as String,
      homePlanet: json['homePlanet'] as String?,
      occupation: json['occupation'] as String,
      sayings:
          (json['sayings'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as int,
      age: json['age'] as String?,
    );

Map<String, dynamic> _$FuturamaCharacterToJson(FuturamaCharacter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
      'gender': instance.gender,
      'species': instance.species,
      'homePlanet': instance.homePlanet,
      'occupation': instance.occupation,
      'sayings': instance.sayings,
      'id': instance.id,
      'age': instance.age,
    };

FuturamaName _$FuturamaNameFromJson(Map<String, dynamic> json) => FuturamaName(
      first: json['first'] as String,
      middle: json['middle'] as String,
      last: json['last'] as String,
    );

Map<String, dynamic> _$FuturamaNameToJson(FuturamaName instance) =>
    <String, dynamic>{
      'first': instance.first,
      'middle': instance.middle,
      'last': instance.last,
    };

FuturamaImages _$FuturamaImagesFromJson(Map<String, dynamic> json) =>
    FuturamaImages(
      headShot: json['head-shot'] as String,
      main: json['main'] as String,
    );

Map<String, dynamic> _$FuturamaImagesToJson(FuturamaImages instance) =>
    <String, dynamic>{
      'head-shot': instance.headShot,
      'main': instance.main,
    };

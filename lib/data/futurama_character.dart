import 'package:json_annotation/json_annotation.dart';

part 'futurama_character.g.dart';

@JsonSerializable()
class FuturamaCharacter {
  final FuturamaName name;
  final FuturamaImages images;
  final String gender;
  final String species;
  final String? homePlanet;
  final String occupation;
  final List<String> sayings;
  final int id;
  final String? age;

  FuturamaCharacter({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    required this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    this.age,
  });

  factory FuturamaCharacter.fromJson(Map<String, dynamic> json) =>
      _$FuturamaCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$FuturamaCharacterToJson(this);
}

@JsonSerializable()
class FuturamaName {
  final String first;
  final String middle;
  final String last;

  FuturamaName({
    required this.first,
    required this.middle,
    required this.last,
  });

  factory FuturamaName.fromJson(Map<String, dynamic> json) =>
      _$FuturamaNameFromJson(json);
  Map<String, dynamic> toJson() => _$FuturamaNameToJson(this);

  String getFullName() {
    String fullName = first;
    if (middle.isNotEmpty) {
      fullName += " $middle";
    }
    fullName += " $last";
    return fullName;
  }
}

@JsonSerializable()
class FuturamaImages {
  @JsonKey(name: 'head-shot')
  final String headShot;
  final String main;

  FuturamaImages({
    required this.headShot,
    required this.main,
  });

  factory FuturamaImages.fromJson(Map<String, dynamic> json) =>
      _$FuturamaImagesFromJson(json);
  Map<String, dynamic> toJson() => _$FuturamaImagesToJson(this);
}

import 'package:futurama/data/futurama_info_creator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'futurama_info.g.dart';

@JsonSerializable()
class FuturamaInfo {
  final String synopsis;
  final String yearsAired;
  final int id;
  final List<FuturamaInfoCreator> creators;

  FuturamaInfo({
    required this.synopsis,
    required this.yearsAired,
    required this.creators,
    required this.id,
  });

  factory FuturamaInfo.fromJson(Map<String, dynamic> json) =>
      _$FuturamaInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FuturamaInfoToJson(this);
}

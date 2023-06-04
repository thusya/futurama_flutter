import 'package:json_annotation/json_annotation.dart';

part 'futurama_info_creator.g.dart';

@JsonSerializable()
class FuturamaInfoCreator {
  final String name;
  final String url;

  FuturamaInfoCreator({
    required this.name,
    required this.url,
  });

  factory FuturamaInfoCreator.fromJson(Map<String, dynamic> json) =>
      _$FuturamaInfoCreatorFromJson(json);

  Map<String, dynamic> toJson() => _$FuturamaInfoCreatorToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  final String id;
  final String name;
  final String hp;
  final Map<String, String> images;

  CardModel({
    required this.id,
    required this.name,
    required this.hp,
    required this.images,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

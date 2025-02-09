import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  final String id;
  final String image;

  CardModel({
    required this.id,
    required this.image,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}

enum CardRarity {
  none,
  oneDiamond,
  twoDiamond,
  threeDiamond,
  fourDiamond,
  oneStar,
  twoStar,
  threeStar,
  crown;

  @override
  String toString() {
    switch (this) {
      case CardRarity.none:
        return "None";
      case CardRarity.oneDiamond:
        return "One Diamond";
      case CardRarity.twoDiamond:
        return "Two Diamond";
      case CardRarity.threeDiamond:
        return "Three Diamond";
      case CardRarity.fourDiamond:
        return "Four Diamond";
      case CardRarity.oneStar:
        return "One Star";
      case CardRarity.twoStar:
        return "Two Star";
      case CardRarity.threeStar:
        return "Three Star";
      case CardRarity.crown:
        return "Crown";
    }
  }
}

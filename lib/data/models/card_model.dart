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

  //낮은 화질의 이미지 URL
  String get imageUrl => "$image/low.webp";

  //높은 화질의 이미지 URL
  String get imageHighUrl => "$image/high.webp";
}

enum CardRarity {
  oneDiamond,
  twoDiamond,
  threeDiamond,
  fourDiamond,
  oneStar,
  ;

  @override
  String toString() {
    switch (this) {
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
    }
  }

  int get count {
    switch (this) {
      case CardRarity.oneDiamond:
        return 1;
      case CardRarity.twoDiamond:
        return 2;
      case CardRarity.threeDiamond:
        return 3;
      case CardRarity.fourDiamond:
        return 4;
      case CardRarity.oneStar:
        return 1;
    }
  }

  bool get isDiamond {
    return this == CardRarity.oneDiamond ||
        this == CardRarity.twoDiamond ||
        this == CardRarity.threeDiamond ||
        this == CardRarity.fourDiamond;
  }

  bool get isStar {
    return this == CardRarity.oneStar;
  }

  static List<CardRarity> get all => [
        oneDiamond,
        twoDiamond,
        threeDiamond,
        fourDiamond,
        oneStar,
      ];
}

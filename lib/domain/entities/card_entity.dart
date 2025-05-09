import 'package:pocket_trade/data/models/card_model.dart';

class CardEntity {
  CardEntity({
    required this.id,
    required this.imageUrl,
    required this.imageHighUrl,
  });

  factory CardEntity.fromModel(CardModel model) {
    return CardEntity(
      id: model.id,
      imageUrl: "${model.image}/low.webp",
      imageHighUrl: "${model.image}/high.webp",
    );
  }

  final String id;
  final String imageUrl;
  final String imageHighUrl;
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

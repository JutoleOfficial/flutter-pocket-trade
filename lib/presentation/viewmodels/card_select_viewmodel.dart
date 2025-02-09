import 'package:flutter/material.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';
import 'package:pocket_trade/presentation/providers/card_provider.dart';

class CardSelectViewModel extends ChangeNotifier {
  final selectedCards = CardProvider(CardService())
    ..getCards(
      name: "Eevee",
      rarity: CardRarity.oneDiamond,
    );
}

import 'package:flutter/material.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';

class CardProvider extends ChangeNotifier {
  final CardService cardService;

  CardProvider(this.cardService);

  final List<CardModel> _cards = [];

  Future<void> getCards({
    required String name,
    required CardRarity rarity,
    bool? suffix,
    String? hp,
    String? page,
    String? pageSize,
  }) async {
    final response = await cardService.getCards(
      name: name,
      cardRarity: rarity,
      suffix: suffix,
      hp: hp,
      page: page,
      pageSize: pageSize,
    );

    _cards.clear();
    _cards.addAll(response);
  }

  void addCard(CardModel card) {
    _cards.add(card);
    notifyListeners();
  }

  void removeCard(CardModel card) {
    _cards.remove(card);
    notifyListeners();
  }
}

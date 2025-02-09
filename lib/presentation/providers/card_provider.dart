import 'package:flutter/material.dart';
import 'package:pocket_trade/core/base/view_state.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';

class CardProvider extends ChangeNotifier {
  final CardService cardService;

  CardProvider(this.cardService);

  BaseState<List<CardModel>> _cards = BaseState.loading();
  BaseState<List<CardModel>> get cards => _cards;

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

    _cards = BaseState.success(response);
    notifyListeners();
  }

  void addCard(CardModel card) {
    if (_cards.isSuccess) {
      final updatedCards = [..._cards.data!, card];
      _cards = BaseState.success(updatedCards);
      notifyListeners();
    }
  }

  void removeCard(CardModel card) {
    if (_cards.isSuccess) {
      final updatedCards =
          _cards.data!.where((element) => element != card).toList();
      _cards = BaseState.success(updatedCards);
      notifyListeners();
    }
  }
}

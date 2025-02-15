import 'package:flutter/material.dart';
import 'package:pocket_trade/core/base/view_state.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/params/card_search_params.dart';
import 'package:pocket_trade/domain/services/card_service.dart';

class CardProvider extends ChangeNotifier {
  final CardService cardService;

  CardProvider(this.cardService);

  BaseState<List<CardModel>> _cards = BaseState.initial();
  BaseState<List<CardModel>> get cards => _cards;

  Future<void> getCards({
    required CardSearchParams params,
  }) async {
    final List<CardModel> response = [];

    try {
      response.addAll(await cardService.getCards(params: params));
    } catch (e) {
      _cards = BaseState.error(e.toString());
      notifyListeners();
      return;
    }

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

  void addCards(List<CardModel> cards) {
    final updatedCards =
        _cards.data != null ? [..._cards.data!, ...cards] : [...cards];
    _cards = BaseState.success(updatedCards);
    notifyListeners();
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

import 'package:flutter/material.dart';
import 'package:pocket_trade/core/base/view_state.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/params/card_search_params.dart';
import 'package:pocket_trade/domain/services/card_service.dart';

class CardSearchBottomSheetViewModel extends ChangeNotifier {
  final CardService cardService;

  CardSearchBottomSheetViewModel({required this.cardService});

  BaseState<List<CardModel>> _cards = BaseState.initial();

  BaseState<List<CardModel>> get cards => _cards;

  CardRarity? _cardRarity;

  CardRarity? get cardRarity => _cardRarity;

  set cardRarity(CardRarity? value) {
    if (_cardRarity == value) {
      _cardRarity = null;
    } else {
      _cardRarity = value;
    }
    notifyListeners();
  }

  Future<void> searchCards() async {
    if (!_validateParams()) return;

    _cards = BaseState.loading();
    notifyListeners();
    try {
      final cards = await cardService.getCards(
        params: CardSearchParams(
          cardRarity: _cardRarity!,
        ),
      );
      _cards = BaseState.success(cards);
      notifyListeners();
    } catch (e) {
      _cards = BaseState.error(e.toString());
      notifyListeners();
    }
  }

  bool _validateParams() {
    if (_cardRarity == null) {
      _cards = BaseState.error('카드 레어리티를 선택해주세요.');
      notifyListeners();
      return false;
    }
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:pocket_trade/core/base/view_state.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';

class CardSearchBottomSheetViewModel extends ChangeNotifier {
  final CardService cardService;

  CardSearchBottomSheetViewModel({required this.cardService});

  BaseState<List<CardModel>> _cards = BaseState.initial();

  BaseState<List<CardModel>> get cards => _cards;
}

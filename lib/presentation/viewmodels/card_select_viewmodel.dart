import 'package:flutter/material.dart';
import 'package:pocket_trade/domain/services/card_service.dart';
import 'package:pocket_trade/presentation/providers/card_provider.dart';

class CardSelectViewModel extends ChangeNotifier {
  final selectedCards = CardProvider(CardService());

  final searchCards = CardProvider(CardService());

  @override
  void dispose() {
    selectedCards.dispose();
    searchCards.dispose();
    super.dispose();
  }
}

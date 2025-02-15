import 'package:pocket_trade/data/models/card_model.dart';

class CardSearchParams {
  final String? name;
  final CardRarity cardRarity;
  final bool? suffix;
  final String? hp;
  final String? page;
  final String? pageSize;

  CardSearchParams({
    this.name,
    required this.cardRarity,
    this.suffix,
    this.hp,
    this.page,
    this.pageSize,
  });
}

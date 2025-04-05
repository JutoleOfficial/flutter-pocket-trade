import 'package:pocket_trade/domain/entities/card_entity.dart';

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

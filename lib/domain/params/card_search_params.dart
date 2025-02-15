import 'package:pocket_trade/core/utils/app_logger.dart';
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
  }) {
    assert(() {
      if ((name == null && suffix == null && hp == null)) {
        AppLogger().logger.e('name, suffix, hp 중 하나는 반드시 포함되어야 합니다.');
        return false;
      }

      return true;
    }());
  }
}

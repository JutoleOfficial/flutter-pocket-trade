import 'package:pocket_trade/core/network/api_client.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/data/repositories/card_repository.dart';

class CardService {
  CardService() {
    final dio = ApiClient.getInstance();
    cardRepository = CardRepository(dio);
  }

  late final CardRepository cardRepository;

  Future<CardModel?> getCard() async {
    final cards = await cardRepository.fetchAllCards();
    return cards.firstOrNull;
  }
}

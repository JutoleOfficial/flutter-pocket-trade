import 'package:pocket_trade/core/network/api_client.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/data/repositories/card_repository.dart';

class CardService {
  CardService() {
    final dio = ApiClient.getInstance();
    cardRepository = CardRepository(dio);
  }

  late final CardRepository cardRepository;

  Future<CardModel> getCard(String id) async {
    return await cardRepository.fetchCardById(id);
  }

  Future<List<CardModel>> getCards({
    required String name,
    required CardRarity cardRarity,
    bool? suffix,
    String? hp,
    String? page,
    String? pageSize,
  }) async {
    return await cardRepository.fetchAllCards(
      name: name,
      cardRarity: cardRarity,
      suffix: suffix,
      hp: hp,
      page: page,
      pageSize: pageSize,
    );
  }
}

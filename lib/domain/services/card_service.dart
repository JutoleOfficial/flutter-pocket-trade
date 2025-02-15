import 'package:pocket_trade/core/network/api_client.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/data/repositories/card_repository.dart';
import 'package:pocket_trade/domain/params/card_search_params.dart';

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
    required CardSearchParams params,
  }) async {
    return await cardRepository.fetchAllCards(
      params: params,
    );
  }
}

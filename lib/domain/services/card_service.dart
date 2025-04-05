import 'package:pocket_trade/core/network/api_client.dart';
import 'package:pocket_trade/data/repositories/card_repository.dart';
import 'package:pocket_trade/domain/entities/card_entity.dart';
import 'package:pocket_trade/domain/params/card_search_params.dart';

class CardService {
  CardService() {
    final dio = ApiClient.getInstance();
    cardRepository = CardRepository(dio);
  }

  late final CardRepository cardRepository;

  Future<CardEntity> getCard(String id) async {
    final cardModel = await cardRepository.fetchCardById(id);
    return CardEntity.fromModel(cardModel);
  }

  Future<List<CardEntity>> getCards({
    required CardSearchParams params,
  }) async {
    final cardModels = await cardRepository.fetchAllCards(
      params: params,
    );
    return cardModels
        .map((cardModel) => CardEntity.fromModel(cardModel))
        .toList();
  }
}

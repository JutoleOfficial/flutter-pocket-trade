import 'package:dio/dio.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/data/repositories/card_repository.dart';

class CardService {
  CardService() {
    final dio = Dio();
    cardRepository = CardRepository(dio);
  }

  late final CardRepository cardRepository;

  Future<CardModel> getCard(String id) async {
    return await cardRepository.fetchCardById(id);
  }
}

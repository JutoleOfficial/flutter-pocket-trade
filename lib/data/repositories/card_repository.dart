import 'package:dio/dio.dart';
import 'package:pocket_trade/core/network/api_service.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/params/card_search_params.dart';

class CardRepository {
  CardRepository(Dio dio) : apiService = ApiService(dio);

  final ApiService apiService;

  Future<CardModel> fetchCardById(String id) async {
    try {
      return await apiService.getCardById(id);
    } catch (e) {
      throw Exception('카드 정보를 가져오는 데 실패했습니다: $e');
    }
  }

  Future<List<CardModel>> fetchAllCards({
    required CardSearchParams params,
  }) async {
    try {
      return await apiService.getCards(
        params.name,
        params.cardRarity.toString(),
        params.suffix == true ? "EX" : null,
        params.hp,
        params.page,
        params.pageSize,
      );
    } catch (e) {
      throw Exception('카드 정보를 가져오는 데 실패했습니다: $e');
    }
  }
}

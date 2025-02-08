import 'package:dio/dio.dart';
import 'package:pocket_trade/core/network/api_service.dart';
import 'package:pocket_trade/data/models/card_model.dart';

class CardRepository {
  CardRepository(Dio dio) : apiService = ApiService(dio);

  final ApiService apiService;

  Future<CardModel> fetchCardById(String id) async {
    try {
      final response = await apiService.getCardById(id);
      return response.data;
    } catch (e) {
      throw Exception('카드 정보를 가져오는 데 실패했습니다: $e');
    }
  }

  Future<List<CardModel>> fetchAllCards() async {
    try {
      final response = await apiService.getCards("2");
      return response.data;
    } catch (e) {
      throw Exception('카드 정보를 가져오는 데 실패했습니다: $e');
    }
  }
}

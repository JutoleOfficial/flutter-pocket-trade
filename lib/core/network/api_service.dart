import 'package:dio/dio.dart' hide Headers;
import 'package:pocket_trade/core/constants/api_constants.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('${ApiConstants.cards}/{id}')
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<CardModel> getCardById(@Path('id') String id);

  @GET(ApiConstants.cards)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<CardModel>> getCards(
    @Query('name') String name,
    @Query('rarity') String rarity,
    @Query('suffix') String? suffix,
    @Query('hp') String? hp,
    @Query('pagination:page') String? page,
    @Query('pagination:itemsPerPage') String? pageSize,
  );
}

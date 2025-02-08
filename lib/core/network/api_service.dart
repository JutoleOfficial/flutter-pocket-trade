import 'package:dio/dio.dart';
import 'package:pocket_trade/core/constants/api_constants.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('${ApiConstants.cards}/{id}')
  Future<CardModel> getCardById(@Path('id') String id);
}

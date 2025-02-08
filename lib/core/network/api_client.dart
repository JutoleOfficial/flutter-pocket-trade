import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiClient {
  static Dio getInstance() {
    final dio = Dio();

    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout =
        Duration(milliseconds: ApiConstants.connectionTimeout);
    dio.options.receiveTimeout =
        Duration(milliseconds: ApiConstants.receiveTimeout);

    dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        request: true,
      ),
    ]);

    return dio;
  }
}

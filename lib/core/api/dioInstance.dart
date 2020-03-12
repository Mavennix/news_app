import 'package:dio/dio.dart';

class DioIinstance {
  connect() {
    Dio dio = Dio(new BaseOptions(
      baseUrl:
          'http://newsapi.org/v2',
      connectTimeout: 30000,
      receiveTimeout: 90000,
    ));
    return dio;
  }
}

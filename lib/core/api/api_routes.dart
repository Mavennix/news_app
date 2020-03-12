import 'package:dio/dio.dart';
import 'package:news_app/core/api/dioInstance.dart';

const apiKey = 'aa1e211839924a09962352ea9bb5dad0';

class ApiRoutes {
  DioIinstance _dio = DioIinstance();

  Future getTopHeadlines() async {
    Response response;
    try {
      response =
          await _dio.connect().get('/top-headlines?country=us&apiKey=$apiKey');
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.response.data);
      return response;
    }
  }

  Future getFavouriteNews() async {
    Response response;
    try {
      response =
          await _dio.connect().get('/top-headlines?q=trump&apiKey=$apiKey');
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.response.data);
      return response;
    }
  }

  Future getNewsCategory({String category}) async {
    Response response;
    try {
      response = await _dio
          .connect()
          .get('/top-headlines?country=us&category=$category&apiKey=$apiKey');
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.response.data);
      return response;
    }
  }
}

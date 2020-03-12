import 'package:news_app/core/api/api_routes.dart';
import 'package:news_app/locator.dart';

class NewsService {
  ApiRoutes _apiRoutes = locator<ApiRoutes>();

  Future getTopHeadlines() async {
    final response = await _apiRoutes.getTopHeadlines();
    return response;
  }

  Future getFavouriteNews() async {
    final response = await _apiRoutes.getFavouriteNews();
    return response;
  }

  Future getNewsCategory({String category}) async {
    final response = await _apiRoutes.getNewsCategory(category: category);
    return response;
  }
}

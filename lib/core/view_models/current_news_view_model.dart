import 'package:news_app/core/data-models/article_data_model.dart';
import 'package:news_app/core/enums/view_state.dart';
import 'package:news_app/core/services/news_service.dart';
import 'package:news_app/core/view_models/base_view_model.dart';
import 'package:news_app/locator.dart';

class CurrentNewsViewModel extends BaseModel {
  NewsService _newsService = locator<NewsService>();

  Future getNewsCategory({String category}) async {
    if (state == ViewState.Busy) {
      return false;
    }
    setState(ViewState.Busy);
    // user.interest = interests;
    final getTopHeadline = await _newsService.getNewsCategory(category: category);
    List<Articles> articles = getTopHeadline["articles"]
          .map((article) => Articles.fromJson(article))
          .toList()
          .cast<Articles>();
    setState(ViewState.Idle);
    return articles;

  }

}
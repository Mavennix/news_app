import 'package:get_it/get_it.dart';
import 'package:news_app/core/api/api_routes.dart';
import 'package:news_app/core/services/news_service.dart';
import 'package:news_app/core/view_models/current_news_view_model.dart';
import 'package:news_app/core/view_models/home_view_model.dart';

GetIt locator = GetIt.instance;
Future setUpLocator() async {
  locator.registerLazySingleton(() => ApiRoutes());
  locator.registerLazySingleton(() => NewsService());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CurrentNewsViewModel());
}

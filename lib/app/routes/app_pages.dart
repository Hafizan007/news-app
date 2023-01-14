import 'package:get/get.dart';

import '../modules/detail_news/bindings/detail_news_binding.dart';
import '../modules/detail_news/views/detail_news_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NEWS;

  static final routes = [
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_NEWS,
      page: () => DetailNewsView(),
      binding: DetailNewsBinding(),
    ),
  ];
}

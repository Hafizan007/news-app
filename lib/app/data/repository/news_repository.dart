import 'package:technical_test/app/data/model/news_response.dart';

import '../../core/model/news_query_params.dart';

abstract class NewsRepository {
  Future<NewsResponse> getListNews(NewsQueryParams newsQueryParams);
}

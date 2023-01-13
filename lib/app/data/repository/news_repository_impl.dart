import 'package:get/instance_manager.dart';
import 'package:technical_test/app/data/model/news_response.dart';
import 'package:technical_test/app/data/remote/news_remote_data_source.dart';
import 'package:technical_test/app/data/repository/news_repository.dart';

import '../../core/model/news_query_params.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _remoteSource =
      Get.find(tag: (NewsRemoteDataSource).toString());
  @override
  Future<NewsResponse> getListNews(NewsQueryParams newsQueryParams) {
    return _remoteSource.getListNews(newsQueryParams);
  }
}

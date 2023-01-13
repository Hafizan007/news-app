import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:technical_test/app/core/base/base_remote_source.dart';
import 'package:technical_test/app/data/model/news_response.dart';

import '../../core/model/news_query_params.dart';
import '../../network/dio_provider.dart';
import 'news_remote_data_source.dart';

class NewsRemoteDataSourceImpl extends BaseRemoteSource
    implements NewsRemoteDataSource {
  @override
  Future<NewsResponse> getListNews(NewsQueryParams newsQueryParams) {
    final endPoint = "${DioProvider.baseUrl}${dotenv.env['URL_LIST_NEWS']}";
    final dioCall = dioClient.get(
      endPoint,
      queryParameters: newsQueryParams.toJson(),
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseUserResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  NewsResponse _parseUserResponse(Response<dynamic> response) {
    return NewsResponse.fromMap(response.data);
  }
}

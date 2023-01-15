import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_controller.dart';
import 'package:technical_test/app/core/model/news_query_params.dart';
import 'package:technical_test/app/data/repository/news_repository.dart';

import '../../../core/base/paging_controller.dart';
import '../../../core/values/news_values.dart';
import '../../../data/model/news_response.dart';
import '../models/news_ui_data.dart';

class NewsController extends BaseController {
  final NewsRepository _repository = Get.find(tag: (NewsRepository).toString());

  final searchTextController = TextEditingController();

  final isError = false.obs;
  final isPagingLoading = false.obs;
  bool isLoadNextPage = false;

  NewsCategory category = NewsCategory.technology;
  NewsCountry country = NewsCountry.us;

  final pagingController = PagingController<NewsUiData>();
  final RxList<NewsUiData> _newsListController = RxList.empty();
  List<NewsUiData> get newsList => _newsListController.toList();

  @override
  void onInit() {
    fetchListNews();
    super.onInit();
  }

  Future<void> fetchListNews() async {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    final queryParams = NewsQueryParams(
      page: pagingController.pageNumber,
      search: searchTextController.text,
      category: category,
      country: country,
    );
    final service = _repository.getListNews(queryParams);

    callDataService(
      service,
      onError: _handleListNewsFailed,
      onSuccess: _handleListNewsesponseSuccess,
      onStart: isLoadNextPage ? _handleStartedCallData : null,
      onComplete: isLoadNextPage ? _handleCompleteCallData : null,
    );

    pagingController.isLoadingPage = false;
  }

  void _handleListNewsesponseSuccess(NewsResponse response) {
    List<NewsUiData>? newsListParse = parseResponse(response.articles);

    final isLastPage = _isLastPage(newsList.length, response.totalResults!);

    if (isLastPage) {
      pagingController.appendLastPage(newsListParse!);
    } else {
      pagingController.appendPage(newsListParse!);
    }

    final newList = [...pagingController.listItems];
    _newsListController(newList);
  }

  List<NewsUiData>? parseResponse(List<Article>? articles) {
    return articles
        ?.map((e) => NewsUiData(
              title: e.title ?? "",
              imageUrl: e.urlToImage ?? "",
              newsUrl: e.url ?? "",
              description: e.description ?? "",
              content: e.content ?? "",
              publishedAt: e.publishedAt ?? "",
              sourceName: e.source?.name ?? "",
            ))
        .toList();
  }

  void _handleListNewsFailed(Exception exception) {
    isError(true);
  }

  void _handleStartedCallData() {
    isPagingLoading(true);
  }

  void _handleCompleteCallData() {
    isPagingLoading(false);

    isLoadNextPage = false;
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (newsList.length + newListItemCount) >= totalCount;
  }

  onSearchChange(String val) async {
    pagingController.initRefresh();

    fetchListNews();
  }

  onLoadNextPage() {
    isLoadNextPage = true;
    logger.i('next page');
    fetchListNews();
  }

  Future<void> onRefresh() async {
    pagingController.initRefresh();
    fetchListNews();
  }

  void onSubmitFilter() {
    pagingController.initRefresh();
    fetchListNews();
    Get.back();
  }

  void onChangeCategory(bool? value, NewsCategory categoryValue) {
    category = categoryValue;
    update();
  }

  void onChangeCountry(bool? value, NewsCountry countryValue) {
    country = countryValue;
    update();
  }
}

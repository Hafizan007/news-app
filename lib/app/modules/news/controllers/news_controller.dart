import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_controller.dart';
import 'package:technical_test/app/core/model/news_query_params.dart';
import 'package:technical_test/app/data/repository/news_repository.dart';

import '../../../core/base/paging_controller.dart';
import '../../../data/model/news_response.dart';
import '../models/news_ui_data.dart';

class NewsController extends BaseController {
  final NewsRepository _repository = Get.find(tag: (NewsRepository).toString());
  final RxList<NewsUiData> _newsListController = RxList.empty();
  final searchTextController = TextEditingController();
  final pagingController = PagingController<NewsUiData>();
  final isError = false.obs;

  NewsCategory category = NewsCategory.technology;
  NewsCountry country = NewsCountry.us;

  List<NewsUiData> get newsList => _newsListController.toList();

  @override
  void onInit() {
    fetchListNews();
    super.onInit();
  }

  void fetchListNews() {
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
    );

    pagingController.isLoadingPage = false;
  }

  void _handleListNewsesponseSuccess(NewsResponse response) {
    List<NewsUiData>? newsList = parseResponse(response.articles);

    final isLastPage = _isLastPage(
      newsList!.length,
      response.totalResults!,
    );

    if (isLastPage) {
      pagingController.appendLastPage(newsList);
    } else {
      pagingController.appendPage(newsList);
    }

    final newList = [...pagingController.listItems];
    _newsListController(newList);
  }

  List<NewsUiData>? parseResponse(List<Article>? articles) {
    return articles
        ?.map((e) => NewsUiData(
              title: e.title ?? "-",
              imageUrl: e.urlToImage ?? "-",
              newsUrl: e.url ?? "-",
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

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (newsList.length + newListItemCount) >= totalCount;
  }

  onSearchChange(String val) async {
    pagingController.initRefresh();

    fetchListNews();
  }

  onLoadNextPage() {
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

enum NewsCategory {
  technology,
  business,
  general,
  entertainment,
  health,
  science,
  sports
}

enum NewsCountry {
  gb,
  us,
  id,
  kr,
  jp,
}

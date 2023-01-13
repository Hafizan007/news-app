import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_controller.dart';
import 'package:technical_test/app/core/model/news_query_params.dart';
import 'package:technical_test/app/data/repository/news_repository.dart';

import '../../../core/base/paging_controller.dart';
import '../../../data/model/news_response.dart';

class NewsController extends BaseController {
  final NewsRepository _repository = Get.find(tag: (NewsRepository).toString());
  final RxList<Article> _newsListController = RxList.empty();
  final searchTextController = TextEditingController();
  final pagingController = PagingController<Article>();
  final isError = false.obs;

  List<Article> get newsList => _newsListController.toList();

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
    final isLastPage = _isLastPage(
      response.articles!.length,
      response.totalResults!,
    );

    if (isLastPage) {
      pagingController.appendLastPage(response.articles!);
    } else {
      pagingController.appendPage(response.articles!);
    }

    final newList = [...pagingController.listItems];
    _newsListController(newList);
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
}

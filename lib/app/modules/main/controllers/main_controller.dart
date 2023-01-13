import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_controller.dart';
import 'package:technical_test/app/core/model/global_query_param.dart';
import 'package:technical_test/app/data/model/user_response.dart';
import 'package:technical_test/app/data/repository/user_repository.dart';

import '../../../core/base/paging_controller.dart';

class MainController extends BaseController {
  final UserRepository _repository = Get.find(tag: (UserRepository).toString());
  final RxList<Data> _usertListController = RxList.empty();
  final searchTextController = TextEditingController();
  final pagingController = PagingController<Data>();

  List<Data> get userList => _usertListController.toList();

  @override
  void onInit() {
    getListUser();
    super.onInit();
  }

  void getListUser() {
    final queryParams = GlobalQueryParam(
      page: pagingController.pageNumber,
      search: searchTextController.text,
    );
    final userService = _repository.getUser(queryParams);

    callDataService(
      userService,
      onSuccess: _handleListUserResponseSuccess,
    );
  }

  void _handleListUserResponseSuccess(UserResponse response) {
    if (_isLastPage(response.data!.length, response.meta!.pagination!.total!)) {
      pagingController.appendLastPage(response.data!);
    } else {
      pagingController.appendPage(response.data!);
    }
    final newList = [...pagingController.listItems];
    _usertListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (userList.length + newListItemCount) >= totalCount;
  }

  onSearchChange(String val) async {
    pagingController.initRefresh();

    getListUser();
  }

  onLoadNextPage() {
    logger.i('next page');
    getListUser();
  }

  Future<void> onRefresh() async {
    pagingController.initRefresh();
    getListUser();
  }

  void deleteUser(int userId) {
    final userService = _repository.deleteUser(userId);
    callDataService(
      userService,
      onSuccess: (response) {
        var data = _usertListController.toList();
        data.removeWhere((item) => item.id == userId);
        _usertListController(data);
      },
    );
  }
}

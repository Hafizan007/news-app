import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:technical_test/app/core/values/app_values.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../core/widget/error_handle_widget.dart';
import '../../../core/widget/paging_view.dart';
import '../controllers/news_controller.dart';
import '../widgets/news_filter_button.dart';
import '../widgets/news_list_content.dart';
import '../widgets/news_search_field.dart';

class NewsView extends BaseView<NewsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: 'Top Headlines News');
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Row(
            children: const [
              NewsSearchField(),
              SizedBox(width: AppValues.halfPadding),
              NewsFilterButton(),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return PagingView(
              isLoading: controller.isPagingLoading.value,
              onLoadNextPage: controller.onLoadNextPage,
              onRefresh: controller.onRefresh,
              child: Visibility(
                visible: !controller.isError.value,
                replacement: ErrorHandleWidget(onTap: controller.onRefresh),
                child: const NewsListContent(),
              ),
            );
          }),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/values/app_values.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../core/widget/paging_view.dart';
import '../controllers/news_controller.dart';
import '../widgets/news_error_handle.dart';
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
          child: PagingView(
            onLoadNextPage: controller.onLoadNextPage,
            onRefresh: controller.onRefresh,
            child: Obx(() {
              return Visibility(
                visible: !controller.isError.value,
                replacement: const NewsErrorHandle(),
                child: const NewsListContent(),
              );
            }),
          ),
        ),
      ],
    );
  }
}

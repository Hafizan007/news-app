import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/values/app_values.dart';
import 'package:technical_test/app/routes/app_pages.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../core/widget/paging_view.dart';
import '../../../core/widget/search_field.dart';
import '../controllers/news_controller.dart';
import '../widgets/news_item.dart';

class NewsView extends BaseView<NewsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: 'Top Headlines News');
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onLoadNextPage: controller.onLoadNextPage,
      onRefresh: controller.onRefresh,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppValues.padding),
            child: SearchField(
              textController: controller.searchTextController,
              hintText: 'Search...',
              onChange: controller.onSearchChange,
            ),
          ),
          Obx(() {
            return Visibility(
              visible: !controller.isError.value,
              replacement: const Text('Sepertinya Terjadi Kesalahan'),
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppValues.padding,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.newsList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: AppValues.height_16),
                  itemBuilder: (context, index) {
                    final itemView = controller.newsList[index];

                    return NewsItem(
                      title: itemView.title,
                      shortDesc: itemView.description,
                      date: itemView.publishedAt,
                      imageUrl: itemView.urlToImage,
                      source: itemView.source?.name,
                      onTap: () => Get.toNamed(
                        Routes.DETAIL_NEWS,
                        arguments: itemView,
                      ),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}

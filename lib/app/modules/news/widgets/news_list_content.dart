import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_values.dart';
import '../../../routes/app_pages.dart';
import '../controllers/news_controller.dart';
import 'news_item.dart';

class NewsListContent extends StatelessWidget {
  const NewsListContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.newsList.length,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
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
      },
    );
  }
}

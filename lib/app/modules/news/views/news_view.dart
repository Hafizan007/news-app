import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/values/app_values.dart';
import 'package:technical_test/app/routes/app_pages.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/bottomsheet/custom_selector_sheet.dart';
import '../../../core/widget/button/button_fiill.dart';
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
            child: Row(
              children: [
                Expanded(
                  child: SearchField(
                    textController: controller.searchTextController,
                    hintText: 'Search...',
                    onChange: controller.onSearchChange,
                  ),
                ),
                const SizedBox(width: AppValues.halfPadding),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.bottomSheet(const NewsFilter()),
                    child: Container(
                      padding: const EdgeInsets.all(AppValues.padding_12),
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        borderRadius:
                            BorderRadius.circular(AppValues.radius_12),
                      ),
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return Visibility(
              visible: !controller.isError.value,
              replacement: const Text('Sepertinya Terjadi Kesalahan'),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.newsList.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppValues.padding,
                  ),
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

class NewsFilter extends StatelessWidget {
  const NewsFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return CustomSelectorSheet(
      title: 'Status',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Category',
            style: AppTextStyle.mediumText(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppValues.height_16),
          Row(
            children: List.generate(NewsCategory.values.length, (index) {
              final category = NewsCategory.values[index];

              return GetBuilder<NewsController>(builder: (_) {
                return ChipNewsLabel(
                  categoryName: category.name,
                  isSelected: category == controller.category,
                  onChange: (value) =>
                      controller.onChangeCategory(value, category),
                );
              });
            }).toList(),
          ),
          const SizedBox(height: AppValues.height_24),
          Text(
            'Country',
            style: AppTextStyle.mediumText(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppValues.height_16),
          Row(
            children: List.generate(NewsCountry.values.length, (index) {
              final category = NewsCountry.values[index];

              return GetBuilder<NewsController>(builder: (_) {
                return ChipNewsLabel(
                  categoryName: category.name,
                  isSelected: category == controller.country,
                  onChange: (value) =>
                      controller.onChangeCountry(value, category),
                );
              });
            }).toList(),
          ),
          const SizedBox(height: AppValues.height_24),
          ButtonFill(text: 'Submit', onTap: controller.onTap)
        ],
      ),
    );
  }
}

class ChipNewsLabel extends StatelessWidget {
  final String? categoryName;
  final bool? isSelected;
  final Function(bool?)? onChange;
  const ChipNewsLabel({
    Key? key,
    x,
    this.categoryName,
    required this.isSelected,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Text(
            categoryName?.toUpperCase() ?? '',
            style: AppTextStyle.smallText(),
          ),
          const SizedBox(width: AppValues.padding_4),
          SizedBox(
            width: 24,
            height: 20,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: const BorderSide(
                  color: AppColors.textBlackColor400, width: 1),
              value: isSelected,
              onChanged: onChange,
            ),
          ),
          const SizedBox(width: AppValues.halfPadding),
        ],
      ),
    );
  }
}

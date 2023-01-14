import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/common_helper.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/bottomsheet/custom_selector_sheet.dart';
import '../../../core/widget/button/button_fiill.dart';
import '../controllers/news_controller.dart';
import 'chip_news_label.dart';

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
          Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            runSpacing: 12.0,
            spacing: 10.0,
            children: List.generate(NewsCategory.values.length, (index) {
              final category = NewsCategory.values[index];

              return GetBuilder<NewsController>(builder: (_) {
                return IntrinsicWidth(
                  child: ChipNewsLabel(
                    categoryName: category.name,
                    isSelected: category == controller.category,
                    onChange: (value) =>
                        controller.onChangeCategory(value, category),
                  ),
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
          Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            runSpacing: 12.0,
            spacing: 10.0,
            children: List.generate(NewsCountry.values.length, (index) {
              final country = NewsCountry.values[index];

              return GetBuilder<NewsController>(builder: (_) {
                return IntrinsicWidth(
                  child: ChipNewsLabel(
                    categoryName: CommonHelper.countryName(country),
                    isSelected: country == controller.country,
                    onChange: (value) =>
                        controller.onChangeCountry(value, country),
                  ),
                );
              });
            }).toList(),
          ),
          const SizedBox(height: AppValues.height_24),
          ButtonFill(text: 'Submit', onTap: controller.onSubmitFilter)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import 'news_filter.dart';

class NewsFilterButton extends StatelessWidget {
  const NewsFilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(const NewsFilter()),
      child: Container(
        padding: const EdgeInsets.all(AppValues.padding_12),
        decoration: BoxDecoration(
          color: AppColors.colorPrimary,
          borderRadius: BorderRadius.circular(AppValues.radius_12),
        ),
        child: const Icon(
          Icons.filter_alt_outlined,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/values/app_values.dart';
import 'package:technical_test/app/core/widget/button/button_fiill.dart';
import 'package:technical_test/gen/assets.gen.dart';

import '../controllers/news_controller.dart';

class NewsErrorHandle extends StatelessWidget {
  const NewsErrorHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppValues.extraLargePadding),
      child: Column(
        children: [
          const SizedBox(height: AppValues.height_24),
          Image.asset(Assets.images.error.path),
          const SizedBox(height: AppValues.height_24),
          ButtonFill(text: 'Try again', onTap: controller.onRefresh)
        ],
      ),
    );
  }
}

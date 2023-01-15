import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_view.dart';
import 'package:technical_test/app/core/values/app_colors.dart';

import '../../../core/widget/custom_app_bar.dart';
import '../controllers/detail_news_controller.dart';

class DetailNewsView extends BaseView<DetailNewsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: controller.news.title);
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(
            color: AppColors.colorPrimary,
          ),
        ),
        visible: controller.isFinisLoaded.value,
        child: InAppWebView(
          headlessWebView: controller.headlessWebView,
          onWebViewCreated: (ctrl) {
            controller.headlessWebView = null;
            controller.webViewController = ctrl;
          },
        ),
      );
    });
  }
}

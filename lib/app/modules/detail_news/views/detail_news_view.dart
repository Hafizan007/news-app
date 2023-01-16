import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_view.dart';

import '../../../core/widget/custom_app_bar.dart';
import '../../../core/widget/error_handle_widget.dart';
import '../controllers/detail_news_controller.dart';

class DetailNewsView extends BaseView<DetailNewsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: controller.news.title);
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Obx(() {
          return Visibility(
            visible: !controller.isError.value,
            replacement: ErrorHandleWidget(onTap: controller.refreshWebview),
            child: InAppWebView(
              initialUrlRequest: controller.initialUrlRequest,
              onProgressChanged: controller.updateLoading,
              onReceivedError: controller.updateError,
              initialSettings: InAppWebViewSettings(
                contentBlockers: controller.contentBlockers,
              ),
              onWebViewCreated: (ctr) {
                controller.webViewController = ctr;
              },
            ),
          );
        }),
        Obx(() {
          return Visibility(
            visible: !controller.isError.value,
            child: Visibility(
              visible: controller.isShowLoading,
              child: SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  value: controller.progress.value,
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}

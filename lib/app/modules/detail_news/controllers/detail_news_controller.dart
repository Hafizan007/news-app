import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_controller.dart';
import 'package:technical_test/app/data/model/news_response.dart';

import '../../../core/values/app_values.dart';

class DetailNewsController extends BaseController {
  Article? article;
  URLRequest? initialUrlRequest;
  InAppWebViewController? webViewController2;
  HeadlessInAppWebView? headlessWebView;

  final List<ContentBlocker> contentBlockers = [];

  final isFinisLoaded = false.obs;

  @override
  void onInit() {
    article = Get.arguments;
    setupWebview();
    runWebview();
    super.onInit();
  }

  @override
  void onClose() {
    headlessWebView?.dispose();
    super.onClose();
  }

  void setupWebview() {
    initialUrlRequest = URLRequest(url: WebUri(article?.url ?? ''));

    for (final adUrlFilter in AppValues.adUrlFilters) {
      contentBlockers.add(
        ContentBlocker(
          trigger: ContentBlockerTrigger(
            urlFilter: adUrlFilter,
          ),
          action: ContentBlockerAction(
            type: ContentBlockerActionType.BLOCK,
          ),
        ),
      );
    }
    contentBlockers.add(
      ContentBlocker(
        trigger: ContentBlockerTrigger(
          urlFilter: ".*",
        ),
        action: ContentBlockerAction(
          type: ContentBlockerActionType.CSS_DISPLAY_NONE,
          selector: ".banner, .banners, .ads, .ad, .advert, header, footer",
        ),
      ),
    );
    headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: initialUrlRequest,
      onProgressChanged: updateLoading,
      onWebViewCreated: (controller) {
        webViewController2 = controller;
      },
      initialSettings: InAppWebViewSettings(
        contentBlockers: contentBlockers,
      ),
    );
  }

  void runWebview() async {
    await headlessWebView?.run();
  }

  void updateLoading(InAppWebViewController controller, int value) {
    if (value > 10) {
      isFinisLoaded(true);
    }
  }
}

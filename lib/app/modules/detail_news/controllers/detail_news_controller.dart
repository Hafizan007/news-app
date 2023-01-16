import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_controller.dart';

import '../../../core/values/app_values.dart';
import '../../news/models/news_ui_data.dart';

class DetailNewsController extends BaseController {
  late NewsUiData news;
  URLRequest? initialUrlRequest;
  InAppWebViewController? webViewController;
  HeadlessInAppWebView? headlessWebView;

  final List<ContentBlocker> contentBlockers = [];

  final progress = 0.0.obs;
  final isError = false.obs;

  bool get isShowLoading => progress.value < 1 && progress.value != 0.0;

  @override
  void onInit() {
    news = Get.arguments;
    setupWebview();
    super.onInit();
  }

  void setupWebview() {
    initialUrlRequest = URLRequest(url: WebUri(news.newsUrl));

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
  }

  void updateLoading(InAppWebViewController controller, int value) {
    progress.value = value / 100;
  }

  void updateError(
    InAppWebViewController controller,
    WebResourceRequest webResourceRequest,
    WebResourceError webResourceError,
  ) {
    bool isConnectionError =
        webResourceError.description == 'net::ERR_ADDRESS_UNREACHABLE';
    print(webResourceError);

    if (isConnectionError) isError(true);
  }

  void refreshWebview() {
    isError(false);
    try {
      webViewController?.reload();
    } catch (e) {
      return;
    }
  }
}

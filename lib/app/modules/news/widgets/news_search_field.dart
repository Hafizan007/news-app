import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widget/search_field.dart';
import '../controllers/news_controller.dart';

class NewsSearchField extends StatelessWidget {
  const NewsSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return Expanded(
      child: SearchField(
        textController: controller.searchTextController,
        hintText: 'Search...',
        onChange: controller.onSearchChange,
      ),
    );
  }
}

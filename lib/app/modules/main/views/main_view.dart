import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/base/base_view.dart';
import 'package:technical_test/app/core/values/app_values.dart';
import 'package:technical_test/app/core/widget/custom_app_bar.dart';
import 'package:technical_test/app/core/widget/paging_view.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/widget/search_field.dart';
import '../controllers/main_controller.dart';

class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: 'User List');
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onLoadNextPage: controller.onLoadNextPage,
      onRefresh: controller.onRefresh,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              AppValues.padding,
            ),
            child: SearchField(
              textController: controller.searchTextController,
              hintText: 'Search...',
              onChange: controller.onSearchChange,
            ),
          ),
          Obx(() {
            return ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(AppValues.padding),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.userList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppValues.height_16),
                itemBuilder: (context, index) {
                  final itemView = controller.userList[index];

                  return UserItem(
                    userId: itemView.id,
                    name: itemView.name,
                    email: itemView.email,
                    onTapDelete: controller.deleteUser,
                  );
                });
          }),
        ],
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String? name, email;
  final int? userId;
  final ValueChanged<int> onTapDelete;

  const UserItem({
    Key? key,
    this.name,
    this.email,
    this.userId,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        constraints: const BoxConstraints(minHeight: 110),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.whiteColor),
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppValues.bigRadius),
        ),
        child: Row(
          children: [
            Image.asset(
              Assets.images.man.path,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: AppValues.margin_16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? '',
                    style: AppTextStyle.largeText(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppValues.height_4),
                  Text(
                    email ?? '',
                    style: AppTextStyle.smallText(),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.colorSecondary,
                    size: 20,
                  ),
                ),
                const SizedBox(height: AppValues.height_10),
                GestureDetector(
                  onTap: userId != null ? () => onTapDelete(userId!) : null,
                  child: const Icon(
                    Icons.delete_outline,
                    color: AppColors.textColorLight,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technical_test/app/core/values/app_text_styles.dart';

import '/app/core/values/app_colors.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Status bar
      ),
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: Text(
        appBarTitleText,
        style: AppTextStyle.mediumText(
          fontWeight: FontWeight.w400,
          color: AppColors.appBarTextColor,
        ),
      ),
    );
  }
}

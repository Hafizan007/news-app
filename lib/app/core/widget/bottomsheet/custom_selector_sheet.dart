import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/app_colors.dart';
import '../../values/app_text_styles.dart';
import '../../values/app_values.dart';

class CustomSelectorSheet extends StatelessWidget {
  final String title;
  final Widget content;

  const CustomSelectorSheet({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: context.height * 0.75,
      ),
      padding: const EdgeInsets.only(
        top: AppValues.largePadding,
        bottom: AppValues.largePadding,
        left: AppValues.padding,
        right: AppValues.padding,
      ),
      decoration: const BoxDecoration(
        color: AppColors.pageBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppValues.radius_20),
          topRight: Radius.circular(AppValues.radius_20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(width: AppValues.margin_18),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.largeText(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: AppValues.margin_20,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, size: AppValues.iconSize20),
                ),
              ),
            ],
          ),
          Flexible(
            child: content,
          ),
        ],
      ),
    );
  }
}

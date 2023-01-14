import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/values/app_values.dart';

class ChipNewsLabel extends StatelessWidget {
  final String? categoryName;
  final bool? isSelected;
  final Function(bool?)? onChange;
  const ChipNewsLabel({
    Key? key,
    x,
    this.categoryName,
    required this.isSelected,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Text(
            categoryName?.toUpperCase() ?? '',
            style: AppTextStyle.smallText(),
          ),
          const SizedBox(width: AppValues.padding_4),
          SizedBox(
            width: 24,
            height: 20,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: const BorderSide(
                  color: AppColors.textBlackColor400, width: 1),
              value: isSelected,
              onChanged: onChange,
            ),
          ),
          const SizedBox(width: AppValues.halfPadding),
        ],
      ),
    );
  }
}

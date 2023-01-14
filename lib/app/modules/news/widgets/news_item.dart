import 'package:flutter/material.dart';

import '../../../core/utils/date_helper.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/values/app_values.dart';
import 'hero_image_item.dart';

class NewsItem extends StatelessWidget {
  final String? title, shortDesc, date, imageUrl, source;
  final Function()? onTap;
  const NewsItem({
    Key? key,
    this.title,
    this.shortDesc,
    this.date,
    this.imageUrl,
    this.source,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppValues.radius_10),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 0,
            color: Colors.grey.shade200,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppValues.radius_10),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppValues.radius_10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppValues.padding_12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroImageItem(
                  imageUrl: imageUrl,
                  source: source,
                ),
                const SizedBox(height: AppValues.height_4),
                Text(
                  title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.mediumText(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColorSecondary,
                  ),
                ),
                const SizedBox(height: AppValues.height_8),
                Text(
                  shortDesc ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.smallText(
                    fontWeight: FontWeight.w300,
                    color: AppColors.textBlackColor400,
                  ),
                ),
                const SizedBox(height: AppValues.height_12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Read More',
                      style: AppTextStyle.smallTextUnderline(),
                    ),
                    Text(
                      DateHelper.strDateToStrDate(date ?? ''),
                      style: AppTextStyle.smallText(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlackColor400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

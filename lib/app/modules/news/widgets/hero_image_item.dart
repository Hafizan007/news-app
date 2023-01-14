import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_text_styles.dart';
import '../../../core/values/app_values.dart';

class HeroImageItem extends StatelessWidget {
  final String? imageUrl;
  final String? source;
  const HeroImageItem({
    Key? key,
    this.imageUrl,
    this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppValues.radius_10),
          child: FancyShimmerImage(
            imageUrl: imageUrl ?? '',
            boxFit: BoxFit.cover,
            alignment: Alignment.topCenter,
            height: AppValues.newsHeroImageHeight,
            width: double.maxFinite,
            errorWidget: const Center(
              child: Icon(Icons.error),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.halfPadding,
              vertical: AppValues.padding_4,
            ),
            decoration: BoxDecoration(
              color: AppColors.colorPrimary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              source ?? '',
              style: AppTextStyle.extraSmallText(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

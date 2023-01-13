import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_values.dart';

class AppTextStyle {
  static TextStyle extraSmallText({
    Color color = AppColors.textColorPrimary,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return GoogleFonts.lexendDeca(
      color: color,
      fontWeight: fontWeight,
      fontSize: AppValues.extraSmallTextSize,
    );
  }

  //Text Sized
  static TextStyle smallText({
    Color color = AppColors.textColorPrimary,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return GoogleFonts.lexendDeca(
      color: color,
      fontWeight: fontWeight,
      fontSize: AppValues.smallTextSize,
    );
  }

  static TextStyle mediumText({
    Color color = AppColors.textColorPrimary,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return GoogleFonts.lexendDeca(
      color: color,
      fontWeight: fontWeight,
      fontSize: AppValues.mediumTextSize,
    );
  }

  static TextStyle largeText({
    Color color = AppColors.textColorPrimary,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.lexendDeca(
      color: color,
      fontWeight: fontWeight,
      fontSize: AppValues.largeTextSize,
    );
  }

  static TextStyle smallTextUnderline({
    Color color = AppColors.textColorPrimary,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.lexendDeca(
      decoration: TextDecoration.underline,
      color: Colors.transparent,
      decorationColor: color,
      decorationThickness: 1.5,
      shadows: [Shadow(offset: const Offset(0, -2), color: color)],
      fontWeight: fontWeight,
      fontSize: AppValues.smallTextSize,
    );
  }
}

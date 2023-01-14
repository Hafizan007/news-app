import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../values/app_colors.dart';
import '../../values/app_values.dart';

class ButtonFill extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool isDisable;
  final bool isLoading;
  final Color enableTextColor;
  final Color disableTextColor;
  final Color enableColor;
  final Color disableColor;
  final double minHeight;
  final double borderWidth;
  final FontWeight fontWeight;
  final double radius;
  final Widget? prefixIcon;
  final double prefixIconPadding;
  final Widget? suffixIcon;
  final double suffixIconPadding;
  final double loadingIconSize;
  final EdgeInsetsGeometry? padding;
  final double textSize;
  final String loadingText;
  final Size? maxSize;
  final MaterialStateProperty<Color?>? shadowColor;

  const ButtonFill({
    Key? key,
    required this.text,
    this.onTap,
    this.isDisable = false,
    this.isLoading = false,
    this.enableTextColor = Colors.white,
    this.disableTextColor = Colors.white,
    this.enableColor = AppColors.colorPrimary,
    this.disableColor = AppColors.disabledButtonBgColor,
    this.minHeight = AppValues.minButtonHeigh,
    this.borderWidth = 1,
    this.fontWeight = FontWeight.w700,
    this.radius = AppValues.smallRadius,
    this.prefixIcon,
    this.prefixIconPadding = 8,
    this.suffixIcon,
    this.suffixIconPadding = 8,
    this.loadingIconSize = AppValues.iconDefaultSize,
    this.padding,
    this.textSize = AppValues.largeTextSize,
    this.loadingText = "Sedang Memuat...",
    this.maxSize,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isDisable || isLoading || onTap == null)
          ? null
          : () async {
              if (onTap != null) await onTap!();
            },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(0, minHeight)),
        maximumSize: MaterialStateProperty.all(maxSize),
        padding: MaterialStateProperty.all(padding),
        shadowColor: shadowColor,
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) return disableColor;

          return enableColor;
        }),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isLoading) ...[
            if (prefixIcon != null) ...[
              prefixIcon!,
              SizedBox(width: prefixIconPadding),
            ],
            Text(
              text,
              style: TextStyle(
                color:
                    isDisable || isLoading ? disableTextColor : enableTextColor,
                fontSize: textSize,
                fontWeight: fontWeight,
              ),
            ),
            if (suffixIcon != null) ...[
              SizedBox(width: suffixIconPadding),
              suffixIcon!,
            ],
          ] else ...[
            SpinKitFadingCircle(
              size: loadingIconSize,
              color:
                  isDisable || isLoading ? disableTextColor : enableTextColor,
            ),
            SizedBox(width: prefixIconPadding),
            Text(
              loadingText,
              style: TextStyle(
                color:
                    isDisable || isLoading ? disableTextColor : enableTextColor,
                fontSize: textSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

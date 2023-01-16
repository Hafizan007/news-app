import 'package:flutter/material.dart';
import 'package:technical_test/app/core/values/app_values.dart';
import 'package:technical_test/app/core/widget/button/button_fiill.dart';
import 'package:technical_test/gen/assets.gen.dart';

class ErrorHandleWidget extends StatelessWidget {
  final Function()? onTap;
  const ErrorHandleWidget({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppValues.extraLargePadding),
      child: Column(
        children: [
          const SizedBox(height: AppValues.height_24),
          Image.asset(Assets.images.error.path),
          const SizedBox(height: AppValues.height_24),
          ButtonFill(text: 'Try again', onTap: onTap)
        ],
      ),
    );
  }
}

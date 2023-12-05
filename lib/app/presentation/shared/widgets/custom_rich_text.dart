import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

Widget richText(
  BuildContext context, {
  required String prefixText,
  required String sufixText,
}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
          text: prefixText,
          style: AppTextStyles.textTheme.labelSmall!.apply(
            color: AppColors.whiteColor,
          ),
        ),
        TextSpan(
          text: sufixText,
          style: AppTextStyles.textTheme.labelMedium!.apply(
            color: AppColors.linkColor,
          ),
        ),
      ],
    ),
  );
}

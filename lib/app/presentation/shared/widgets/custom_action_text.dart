// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

Widget ActionText(
  BuildContext context, {
  required String prefixText,
  required String actionText,
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
          text: actionText,
          style: AppTextStyles.textTheme.labelMedium!.apply(
            color: AppColors.linkColor,
          ),
        ),
      ],
    ),
  );
}

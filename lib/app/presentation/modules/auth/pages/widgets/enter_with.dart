import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

Widget enterWith(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Row(
    children: [
      Expanded(
        child: Container(
          height: 1,
          width: size.width,
          color: AppColors.lineColor,
        ),
      ),
      const SizedBox(height: 40),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          "ou",
          style: AppTextStyles.textTheme.labelSmall!.apply(
            color: AppColors.whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 15),
      Expanded(
        child: Container(
          height: 1,
          width: size.width,
          color: AppColors.lineColor,
        ),
      ),
    ],
  );
}

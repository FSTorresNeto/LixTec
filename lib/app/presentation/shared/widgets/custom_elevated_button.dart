import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.iconPath,
    this.backgroundColor = AppColors.primaryColor,
    this.showGradient = true,
    this.isEnabled = true,
  });

  final String label;
  final void Function()? onTap;
  final String? iconPath;
  final Color backgroundColor;
  final bool showGradient;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.textScaleFactorOf(context);
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: showGradient
            ? [
                BoxShadow(
                  color: isEnabled
                      ? backgroundColor.withOpacity(0.6)
                      : AppColors.lockedColor,
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? backgroundColor
              : const Color.fromARGB(255, 255, 0, 0),
        ),
        child: iconPath != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    iconPath!,
                    height: 23,
                    width: 23,
                  ),
                  SizedBox(width: gap),
                  Flexible(
                    child: Text(
                      label,
                      style: AppTextStyles.textTheme.labelSmall!.apply(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                ],
              )
            : Text(
                label,
                style: AppTextStyles.textTheme.labelMedium!.apply(
                  color: AppColors.whiteColor,
                ),
              ),
      ),
    );
  }
}

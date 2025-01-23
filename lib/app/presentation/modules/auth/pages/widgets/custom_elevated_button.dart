// Dart imports:
import 'dart:math' as math;
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
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
    final double scale = MediaQuery.textScalerOf(context).scale(1);
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: _buildBoxShadow(),
      ),
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? backgroundColor : AppColors.lockedColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: BuildButtonContent(gap),
      ),
    );
  }

  List<BoxShadow> _buildBoxShadow() {
    if (showGradient) {
      return [
        BoxShadow(
          color: isEnabled
              ? backgroundColor.withValues(alpha: 0.6)
              : AppColors.lockedColor,
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ];
    }
    return [];
  }

  Widget BuildButtonContent(double gap) {
    if (iconPath != null) {
      return Row(
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return Text(
      label,
      style: AppTextStyles.textTheme.labelMedium!.apply(
        color: AppColors.whiteColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

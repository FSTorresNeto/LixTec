// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class LoadPopUp extends StatelessWidget {
  const LoadPopUp({Key? key, this.loadingText}) : super(key: key);

  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: AppColors.blackColor.withOpacity(0.5),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(
                color: AppColors.linkColor,
                backgroundColor: AppColors.whiteColor,
              ),
              const SizedBox(height: 16.0),
              if (loadingText != null)
                Text(
                  loadingText!,
                  style: AppTextStyles.textTheme.bodySmall!.apply(
                    color: AppColors.whiteColor,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

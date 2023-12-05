import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class LoadPopUp extends StatelessWidget {
  const LoadPopUp({Key? key, this.loadingText}) : super(key: key);

  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withOpacity(0.5),
      body: Center(
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
    );
  }
}

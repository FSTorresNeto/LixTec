import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 6.0,
      ),
      alignment: Alignment.topCenter,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    color: AppColors.whiteColor,
                    child: const Icon(
                      Icons.account_circle,
                      size: 60.0,
                      color: AppColors.darkColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'UserName',
                  style: AppTextStyles.textTheme.labelSmall!.apply(
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

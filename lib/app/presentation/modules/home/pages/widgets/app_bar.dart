import 'package:flutter/material.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class AppNavigateBar extends StatelessWidget implements PreferredSizeWidget {
  AppNavigateBar(
      {Key? key, required this.userName, required this.googleUserImageUrl});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 0.0);

  final String userName;
  final String googleUserImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.darkColor,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(googleUserImageUrl),
              radius: 14.0,
            ),
            const SizedBox(width: 8.0),
            Text(
              'Olá, $userName',
              style: AppTextStyles.textTheme.bodySmall!.apply(),
            ),
          ],
        ),
      ),
    );
  }
}

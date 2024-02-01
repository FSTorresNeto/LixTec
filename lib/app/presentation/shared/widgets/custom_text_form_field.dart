import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:lixtec/app/presentation/modules/auth/auth_state.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.sufixIcon,
    this.isSecret = false,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String hintText;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final bool isSecret;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  final AuthState authState = Modular.get<AuthState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        child: TextFormField(
          onChanged: onChanged,
          obscureText: authState.showPassword.value && isSecret,
          controller: controller,
          validator: validator,
          style: AppTextStyles.textTheme.labelSmall!.apply(
            color: AppColors.whiteColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(
                            prefixIcon,
                            color: AppColors.inputLabelColor,
                            size: 23,
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
            suffixIcon: isSecret
                ? IconButton(
                    splashRadius: 0.1,
                    onPressed: () => authState.showAndHidePassword(),
                    icon: Icon(
                      authState.showPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.inputLabelColor,
                      size: 23,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

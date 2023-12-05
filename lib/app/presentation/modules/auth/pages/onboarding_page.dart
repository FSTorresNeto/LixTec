import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lixtec/app/presentation/modules/auth/auth_state.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_elevated_button.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_rich_text.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({super.key});

  final AuthState authState = Modular.get<AuthState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding_background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          'assets/icons/app_icon.png',
                          width: 120,
                          height: 120,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Bem vindo ao Aplicativo da LixTec',
                          style: AppTextStyles.textTheme.titleSmall!.apply(
                            color: AppColors.whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        CustomElevatedButton(
                          label: "Explorar",
                          onTap: () => Modular.to.pushNamed('/register'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    child: richText(
                      context,
                      prefixText: "Já possui uma conta? ",
                      sufixText: "Entrar agora",
                    ),
                    onTap: () => Modular.to.pushNamed('/login'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

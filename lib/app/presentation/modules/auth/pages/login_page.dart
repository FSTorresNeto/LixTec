import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lixtec/app/presentation/modules/auth/auth_state.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/widgets/enter_with.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';
import 'package:lixtec/app/presentation/shared/utils/input_validators.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_arrow_back.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_elevated_button.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_loading_popup.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_rich_text.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthState authState = Modular.get<AuthState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customArrowBack(),
                  Container(
                    margin: EdgeInsets.only(top: (mediaQuery.height / 5) - 100),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Entre na sua\nconta",
                            style: AppTextStyles.textTheme.displayLarge!.apply(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            hintText: "Digite seu e-mail",
                            prefixIcon: Icons.email,
                            controller: _emailController,
                            validator: emailValidator,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: "Digite sua senha",
                            prefixIcon: Icons.lock,
                            isSecret: true,
                            controller: _passwordController,
                            validator: passwordValidator,
                          ),
                          const SizedBox(height: 30),
                          CustomElevatedButton(
                            label: "Entrar",
                            onTap: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                authState.signIn(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                              }
                            },
                            isEnabled: _emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Esqueceu sua senha?",
                            style: AppTextStyles.textTheme.labelSmall!.apply(
                              color: AppColors.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          enterWith(context),
                          const SizedBox(height: 30),
                          CustomElevatedButton(
                            label: "Entrar com o google",
                            onTap: () async => await authState.googleSignIn(),
                            iconPath: "assets/icons/google_signin.png",
                            backgroundColor: AppColors.inputFillColor,
                            showGradient: false,
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            child: richText(
                              context,
                              prefixText: "Não possui uma conta? ",
                              sufixText: "Criar agora",
                            ),
                            onTap: () => Modular.to.pushNamed('/register'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
            if (authState.loading.value) {
              return const LoadPopUp();
            }

            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}

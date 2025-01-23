// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// Project imports:
import 'package:lixtec/app/presentation/modules/auth/auth_state.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/widgets/custom_elevated_button.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/widgets/enter_with.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';
import 'package:lixtec/app/presentation/shared/utils/input_validators.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_action_text.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_arrow_back.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_loading_popup.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthState authState = Modular.get<AuthState>();
  String email = '';
  String password = '';
  bool _isButtonEnabled = false;

/* TODO: Mover para o app_state */
  void updateButtonEnabled() {
    if (password.length >= 8 && email.isNotEmpty) {
      _isButtonEnabled = true;
    } else {
      _isButtonEnabled = false;
    }
  }

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
                  CustomArrowBack(),
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
                          SizedBox(height: 30),
                          CustomTextFormField(
                            hintText: "Digite seu e-mail",
                            prefixIcon: Icons.email,
                            controller: _emailController,
                            validator: (email) {
                              var result = emailValidator(email);
                              return result['isValid']
                                  ? null
                                  : result['message'];
                            },
                            onChanged: (text) {
                              email = _emailController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: "Digite sua senha",
                            prefixIcon: Icons.lock,
                            isSecret: true,
                            controller: _passwordController,
                            validator: (password) {
                              var result = passwordValidator(password);
                              return result['isValid']
                                  ? null
                                  : result['message'];
                            },
                            onChanged: (text) {
                              email = _emailController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          SizedBox(height: 30),
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
                            isEnabled: _isButtonEnabled,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Esqueceu sua senha?",
                            style: AppTextStyles.textTheme.labelSmall!.apply(
                              color: AppColors.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          EnterWith(context),
                          SizedBox(height: 30),
                          CustomElevatedButton(
                            label: "Entrar com o google",
                            onTap: () async => await authState.googleSignIn(),
                            iconPath: "assets/icons/google_signin.png",
                            backgroundColor: AppColors.inputFillColor,
                            showGradient: false,
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            child: ActionText(
                              context,
                              prefixText: "Não possui uma conta?",
                              actionText: "Criar agora",
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

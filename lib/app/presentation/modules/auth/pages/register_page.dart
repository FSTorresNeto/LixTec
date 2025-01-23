// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

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

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthState authState = Modular.get<AuthState>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String email = '';
  String password = '';
  String name = '';
  bool _isButtonEnabled = false;

  void updateButtonEnabled() {
    if (password.length >= 8 && email.isNotEmpty && name.isNotEmpty) {
      _isButtonEnabled = true;
    } else {
      _isButtonEnabled = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
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
                            "Crie sua conta\nagora",
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
                              name = _nameController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: "Digite seu nome",
                            prefixIcon: Icons.person,
                            controller: _nameController,
                            validator: (name) {
                              var result = nameValidator(name);
                              return result['isValid']
                                  ? null
                                  : result['message'];
                            },
                            onChanged: (text) {
                              email = _emailController.text;
                              name = _nameController.text;
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
                              name = _nameController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            child: ActionText(
                              context,
                              prefixText:
                                  "Ao se registrar voce concorda com os termos: ",
                              actionText: "Ler termos de uso",
                            ),
                            onTap: () => Modular.to.pushNamed('/terms'),
                          ),
                          SizedBox(height: 20),
                          CustomElevatedButton(
                              label: "Criar conta",
                              onTap: () async {
                                FocusScope.of(context).unfocus();

                                if (_formKey.currentState!.validate()) {
                                  authState.signUp(
                                    _emailController.text,
                                    _nameController.text,
                                    _passwordController.text,
                                  );
                                }
                              },
                              isEnabled: _isButtonEnabled),
                          SizedBox(height: 20),
                          EnterWith(context),
                          SizedBox(height: 10),
                          CustomElevatedButton(
                            label: "Cadastrar com o google",
                            onTap: () async => await authState.googleSignIn(),
                            iconPath: "assets/icons/google_signin.png",
                            backgroundColor: AppColors.inputFillColor,
                            showGradient: false,
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            child: ActionText(
                              context,
                              prefixText: "Já possui uma conta? ",
                              actionText: "Entrar agora",
                            ),
                            onTap: () => Modular.to.pushNamed('/login'),
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
              return LoadPopUp();
            }

            return SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}

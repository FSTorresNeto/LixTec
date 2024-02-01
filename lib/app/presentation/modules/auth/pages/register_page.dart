import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
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
    if (password.length >= 7 && email.isNotEmpty && name.isNotEmpty) {
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
                            "Crie sua conta\nagora",
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
                            onChanged: (text) {
                              email = _emailController.text;
                              name = _nameController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: "Digite seu nome",
                            prefixIcon: Icons.person,
                            controller: _nameController,
                            validator: nameValidator,
                            onChanged: (text) {
                              email = _emailController.text;
                              name = _nameController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: "Digite sua senha",
                            prefixIcon: Icons.lock,
                            isSecret: true,
                            controller: _passwordController,
                            validator: passwordValidator,
                            onChanged: (text) {
                              email = _emailController.text;
                              name = _nameController.text;
                              password = _passwordController.text;
                              updateButtonEnabled();
                            },
                          ),
                          const SizedBox(height: 30),
                          GestureDetector(
                            child: richText(
                              context,
                              prefixText:
                                  "Ao se registrar voce concorda com os termos: ",
                              sufixText: "Ler termos de uso",
                            ),
                            onTap: () => Modular.to.pushNamed('/terms'),
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          enterWith(context),
                          const SizedBox(height: 10),
                          CustomElevatedButton(
                            label: "Entrar com o google",
                            onTap: () async => await authState.googleSignIn(),
                            iconPath: "assets/icons/google_signin.png",
                            backgroundColor: AppColors.inputFillColor,
                            showGradient: false,
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            child: richText(
                              context,
                              prefixText: "Já possui uma conta? ",
                              sufixText: "Entrar agora",
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
              return const LoadPopUp();
            }

            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}

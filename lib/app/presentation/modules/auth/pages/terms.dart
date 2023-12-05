import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lixtec/app/presentation/modules/auth/auth_state.dart';
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_arrow_back.dart';

class TermsPage extends StatelessWidget {
  TermsPage({Key? key}) : super(key: key);

  final AuthState authState = Modular.get<AuthState>();

  final _formKey = GlobalKey<FormState>();

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
                          Center(
                            child: Text(
                              "Termos do App",
                              style:
                                  AppTextStyles.textTheme.displayLarge!.apply(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Bem-vindo ao aplicativo LixTec. Ao usar este aplicativo, você concorda com os seguintes termos e condições de uso. Se você não concordar com esses termos, por favor, não use o aplicativo.",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "1. Informações Coletadas",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "O aplicativo LixTec coleta as seguintes informações do usuário: Nome, Telefone, Email, Dados de Depósito.",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "2. Compartilhamento de Informações",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "O aplicativo LixTec poderá compartilhar suas informações apenas nas seguintes circunstâncias: apresentação em percentual de dados de clientes para apresentação de dados para a UFC.",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "3. Segurança das Informações",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Faremos todos os esforços razoáveis para garantir a segurança das informações que você nos forneceu, de acordo com as melhores práticas da indústria.",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "4. Consentimento",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "5. Alterações nos Termos de Uso",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Podemos atualizar estes Termos de Uso periodicamente. Quaisquer alterações significativas serão comunicadas a você por meio do aplicativo ou por outros meios adequados.",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            " 6. Contato",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Se você tiver alguma dúvida ou preocupação sobre estes Termos de Uso ou a coleta de informações, entre em contato conosco pelo email lixtec@gmail.com.br.",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Ao usar o aplicativo LixTec, você concorda em cumprir estes Termos de Uso. O não cumprimento destes termos pode resultar na suspensão ou encerramento de sua conta. Obrigado por usar o aplicativo!",
                            style: AppTextStyles.textTheme.titleSmall!.apply(
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

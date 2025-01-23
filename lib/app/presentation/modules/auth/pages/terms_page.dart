// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';
import 'package:lixtec/app/presentation/shared/widgets/custom_arrow_back.dart';

class TermsPage extends StatelessWidget {
  TermsPage({Key? key}) : super(key: key);

  final List<Map<String, String>> termsContent = [
    {
      'title': 'Informações Coletadas',
      'description':
          'O aplicativo LixTec coleta as seguintes informações do usuário: Nome, Telefone, Email, Dados de Depósito.',
    },
    {
      'title': 'Compartilhamento de Informações',
      'description':
          'O aplicativo LixTec poderá compartilhar suas informações apenas nas seguintes circunstâncias: apresentação em percentual de dados de clientes para apresentação de dados para a UFC.',
    },
    {
      'title': 'Segurança das Informações',
      'description':
          'Faremos todos os esforços razoáveis para garantir a segurança das informações que você nos forneceu, de acordo com as melhores práticas da indústria.',
    },
    {
      'title': 'Alterações nos Termos de Uso',
      'description':
          'Podemos atualizar estes Termos de Uso periodicamente. Quaisquer alterações significativas serão comunicadas a você por meio do aplicativo ou por outros meios adequados.',
    },
    {
      'title': 'Contato',
      'description':
          'Se você tiver alguma dúvida ou preocupação sobre estes Termos de Uso ou a coleta de informações, entre em contato conosco pelo email lixtec@gmail.com.br.',
    },
    {
      'title': 'Consentimento',
      'description':
          'Ao usar o aplicativo LixTec, você concorda em cumprir estes Termos de Uso. O não cumprimento destes termos pode resultar na suspensão ou encerramento de sua conta. Obrigado por usar o aplicativo!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CustomArrowBack(),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Termos do App",
                  style: AppTextStyles.textTheme.displayLarge!.apply(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Bem-vindo ao aplicativo LixTec. Ao usar este aplicativo, você concorda com os seguintes termos e condições de uso. Se você não concordar com esses termos, por favor, não use o aplicativo.",
                style: AppTextStyles.textTheme.titleSmall!.apply(
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              ...termsContent.map((term) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      term['title']!,
                      style: AppTextStyles.textTheme.titleMedium!.apply(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      term['description']!,
                      style: AppTextStyles.textTheme.bodySmall!.apply(
                        color: AppColors.whiteColor,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

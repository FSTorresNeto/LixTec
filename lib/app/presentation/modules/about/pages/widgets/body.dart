// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class BodyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleText(),
            const SizedBox(height: 20.0),
            _buildAboutText(),
            const SizedBox(height: 20.0),
            _buildRewardsText(),
            const SizedBox(height: 20.0),
            _buildFinalMessageText(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      'Um pouquinho sobre nós',
      style: AppTextStyles.textTheme.titleSmall!.apply(
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _buildAboutText() {
    return Text(
      'Somos uma iniciativa para transformar a maneira como encaramos o descarte de lixo eletrônico. Conscientes do impacto ambiental causado pelo descarte inadequado de dispositivos eletrônicos, criamos uma solução inovadora que não apenas incentiva, mas também recompensa a reciclagem responsável.',
      style: AppTextStyles.textTheme.bodyLarge!.apply(
        color: AppColors.whiteColor,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildRewardsText() {
    return Text(
      'A reciclagem no GreenTechRecycle não é apenas uma ação positiva para o planeta, mas também para o usuário. Ao reciclar, os usuários acumulam pontos que podem ser trocados por descontos em produtos sustentáveis, ingressos para eventos eco-friendly e muito mais. Transformamos a reciclagem em uma experiência gratificante!',
      style: AppTextStyles.textTheme.bodyLarge!.apply(
        color: AppColors.whiteColor,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildFinalMessageText() {
    return Text(
      'Somos um movimento para criar um futuro mais verde e sustentável. Junte-se a nós na jornada para reduzir o impacto ambiental do lixo eletrônico e promover práticas de consumo responsáveis.',
      style: AppTextStyles.textTheme.bodyLarge!.apply(
        color: AppColors.whiteColor,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

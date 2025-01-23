// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_colors.dart';
import 'package:lixtec/app/presentation/shared/theme/app_text_style.dart';

class BodyComponent extends StatelessWidget {
  const BodyComponent(
      {super.key, required this.selectedIndex, required this.userId});

  final int selectedIndex;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeText(),
          const SizedBox(height: 20),
          _buildIntroText(),
          const SizedBox(height: 20),
          _buildTutorialButtons(context),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        'Seja bem-vindo',
        style: AppTextStyles.textTheme.headlineMedium!.apply(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget _buildIntroText() {
    return Text(
      'Nesta tela, você pode encontrar tutoriais sobre diferentes recursos do aplicativo. '
      'Escolha uma opção abaixo para aprender mais:',
      textAlign: TextAlign.center,
      style: AppTextStyles.textTheme.bodyLarge!.apply(
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _buildTutorialButtons(BuildContext context) {
    return Column(
      children: [
        _buildTutorialButton(
          context: context,
          buttonText: 'Sobre o Ranking',
          onPressed: () => _navigateToTutorial(
              context,
              'Ranking',
              'A medida que você escaneia os QrCodes, é realizado o acréscimo de acordo com o valor colocado no seu Ranking.',
              'assets/tutorial/ranking.png',
              Icons.star),
        ),
        _buildTutorialButton(
          context: context,
          buttonText: 'Sobre o QrCode',
          onPressed: () => _navigateToTutorial(
              context,
              'QrCode',
              'Ao usar o Scanner pela balança para contabilizar os quilos pesados para o seu Ranking, esses QrCodes são gerados pela balança.',
              'assets/tutorial/QrCodeExample.png',
              Icons.qr_code_scanner),
        ),
        _buildTutorialButton(
          context: context,
          buttonText: 'Sobre as Listas de Lixeiras',
          onPressed: () => _navigateToTutorial(
              context,
              'Listagem de lixeiras',
              'Aqui temos uma lista das lixeiras da cidade com localização por meio do Google Maps.',
              'assets/tutorial/trashList.png',
              Icons.location_on),
        ),
      ],
    );
  }

  Widget _buildTutorialButton({
    required BuildContext context,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          buttonText,
          style: AppTextStyles.textTheme.bodyMedium!.apply(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  void _navigateToTutorial(
    BuildContext context,
    String title,
    String content,
    String imagePath,
    IconData icon,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialScreen(
          title: title,
          content: content,
          iconInfoList: [
            IconInfo(icon: icon, textBelowIcon: ''),
          ],
          imagePath: imagePath,
        ),
      ),
    );
  }
}

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({
    required this.title,
    required this.content,
    required this.iconInfoList,
    required this.imagePath,
  });

  final String title;
  final String content;
  final List<IconInfo> iconInfoList;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTextStyles.textTheme.headlineSmall!.apply(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              content,
              style: AppTextStyles.textTheme.bodyLarge!.apply(
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            for (var iconInfo in iconInfoList) _buildIconInfo(iconInfo),
          ],
        ),
      ),
    );
  }

  Widget _buildIconInfo(IconInfo iconInfo) {
    return Row(
      children: [
        Icon(
          iconInfo.icon,
          color: AppColors.whiteColor,
        ),
        const SizedBox(width: 8.0),
        Text(
          iconInfo.textBelowIcon,
          style: AppTextStyles.textTheme.bodySmall!.apply(
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}

class IconInfo {
  final IconData icon;
  final String textBelowIcon;

  IconInfo({
    required this.icon,
    required this.textBelowIcon,
  });
}

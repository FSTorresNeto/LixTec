// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Project imports:
import 'package:lixtec/app/presentation/shared/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LixTec',
      builder: Asuka.builder,
      theme: AppTheme.themeData,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}

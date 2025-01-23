// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Project imports:
import 'package:lixtec/app/app_module.dart';
import 'package:lixtec/app/app_widget.dart';
import 'package:lixtec/config/firebase_options.dart';
import 'package:lixtec/permission/permission_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await requestAllPermissions();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

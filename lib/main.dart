import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lixtec/app/app_module.dart';
import 'package:lixtec/app/app_widget.dart';
import 'package:lixtec/firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _requestCameraPermission();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

Future<void> _requestCameraPermission() async {
  var status = await Permission.camera.status;

  if (!status.isGranted) {
    await Permission.camera.request();
    await Permission.location.request();
  }
}

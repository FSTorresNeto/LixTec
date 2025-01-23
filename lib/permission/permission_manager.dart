// Package imports:
import 'package:permission_handler/permission_handler.dart';

Future<void> requestAllPermissions() async {
  await [
    Permission.camera,
    Permission.location,
    Permission.storage,
  ].request();
}

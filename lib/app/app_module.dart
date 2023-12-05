import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lixtec/app/presentation/modules/auth/auth_module.dart';
import 'package:lixtec/app/presentation/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((_) => FirebaseAuth.instance),
    Bind((_) => FirebaseFirestore.instance),
    Bind((_) => GoogleSignIn()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}

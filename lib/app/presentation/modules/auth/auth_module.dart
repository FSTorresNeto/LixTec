// Package imports:
import 'package:flutter_modular/flutter_modular.dart';

// Project imports:
import 'package:lixtec/app/data/data_sources/firebase/auth_data_source.dart';
import 'package:lixtec/app/data/data_sources/firebase/auth_data_source_impl.dart';
import 'package:lixtec/app/data/repositories/auth_repository_impl.dart';
import 'package:lixtec/app/domain/repositories/auth_repository.dart';
import 'package:lixtec/app/domain/use_cases/get_current_user_use_case.dart';
import 'package:lixtec/app/domain/use_cases/google_signin_use_case.dart';
import 'package:lixtec/app/domain/use_cases/signin_use_case.dart';
import 'package:lixtec/app/domain/use_cases/signup_use_case.dart';
import 'package:lixtec/app/presentation/modules/auth/auth_state.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/login_page.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/onboarding_page.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/register_page.dart';
import 'package:lixtec/app/presentation/modules/auth/pages/terms_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<AuthState>((i) => AuthState(i.get(), i.get(), i.get())),
    Bind.lazySingleton((i) => GoogleSignUseCase(authRepository: i.get())),
    Bind.lazySingleton((i) => SignUpUseCase(authRepository: i.get())),
    Bind.lazySingleton((i) => SignInUseCase(authRepository: i.get())),
    Bind.lazySingleton((i) => GetCurrentUserUseCase(authRepository: i.get())),
    Bind.lazySingleton<AuthRepository>(
        (i) => AuthRepositoryImpl(authDataSource: i.get())),
    Bind.lazySingleton<AuthDataSource>((i) => AuthDataSourceImpl(
        fireStore: i.get(), firebaseAuth: i.get(), googleSignin: i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OnboardingPage()),
    ChildRoute('/register', child: (_, args) => RegisterPage()),
    ChildRoute('/login', child: (_, args) => LoginPage()),
    ChildRoute('/terms', child: (_, args) => TermsPage()),
  ];
}

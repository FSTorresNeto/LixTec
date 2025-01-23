// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/use_cases/google_signin_use_case.dart';
import 'package:lixtec/app/domain/use_cases/signin_use_case.dart';
import 'package:lixtec/app/domain/use_cases/signup_use_case.dart';

class AuthState extends GetxController {
  final GoogleSignUseCase _googleSignUseCaseImpl;
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;

  RxBool showPassword = true.obs;
  RxBool loading = false.obs;

  AuthState(
    this._googleSignUseCaseImpl,
    this._signUpUseCase,
    this._signInUseCase,
  );

  Future<void> googleSignIn() async {
    await _performAuthAction(
      action: _googleSignUseCaseImpl.call,
      onSuccess: (user) => _navigateToHome(user),
    );
  }

  Future<void> signUp(String email, String name, String password) async {
    await _performAuthAction(
      action: () => _signUpUseCase.call(
        UserEntity(email: email, name: name, password: password),
      ),
      onSuccess: (user) => _navigateToHome(user),
    );
  }

  Future<void> signIn(String email, String password) async {
    await _performAuthAction(
      action: () => _signInUseCase.call(
        UserEntity(email: email, password: password),
      ),
      onSuccess: (user) => _navigateToHome(user),
    );
  }

  Future<void> getCurrentUser() async {
    try {
      loading.value = true;
      loading.value = false;
      Modular.to.navigate('/onboarding');
    } catch (e) {
      loading.value = false;
      Modular.to.navigate('/onboarding');
    }
  }

  Future<void> _performAuthAction({
    required Future<UserEntity> Function() action,
    required Function(UserEntity) onSuccess,
  }) async {
    try {
      loading.value = true;
      final user = await action();
      loading.value = false;
      onSuccess(user);
    } catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
      log(e.toString());
      loading.value = false;
    }
  }

  void _navigateToHome(UserEntity user) {
    Modular.to.navigate('/home/', arguments: user);
  }

  bool showAndHidePassword() {
    showPassword.value = !showPassword.value;
    update();
    return showPassword.value;
  }
}

import 'dart:developer';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:lixtec/app/domain/entities/user_entity.dart';
import 'package:lixtec/app/domain/use_cases/get_current_user_use_case.dart';
import 'package:lixtec/app/domain/use_cases/google_signin_use_case.dart';
import 'package:lixtec/app/domain/use_cases/signin_use_case.dart';
import 'package:lixtec/app/domain/use_cases/signup_use_case.dart';

class AuthState extends GetxController {
  final GoogleSignUseCase _googleSignUseCaseImpl;
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthState(
    this._googleSignUseCaseImpl,
    this._signUpUseCase,
    this._signInUseCase,
    this._getCurrentUserUseCase,
  );

  RxBool showPassword = true.obs;
  RxBool loading = false.obs;

  Future<void> googleSignIn() async {
    try {
      loading.value = true;

      final user = await _googleSignUseCaseImpl.call();

      loading.value = false;

      Modular.to.navigate('/home/', arguments: user);
    } catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
      log(e.toString());

      loading.value = false;
    }
  }

  Future<void> signUp(String email, String name, String password) async {
    try {
      loading.value = true;
      final user = await _signUpUseCase.call(
        UserEntity(email: email, name: name, password: password),
      );

      loading.value = false;

      Modular.to.navigate('/home/', arguments: user);
    } catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
      log(e.toString());

      loading.value = false;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      loading.value = true;

      final user = await _signInUseCase.call(
        UserEntity(email: email, password: password),
      );

      loading.value = false;

      Modular.to.navigate('/home/', arguments: user);
    } catch (e) {
      AsukaSnackbar.alert(e.toString()).show();
      log(e.toString());

      loading.value = false;
    }
  }

  Future<void> getCurrentUser() async {
    try {
      loading.value = true;
      final user = await _getCurrentUserUseCase.call();

      if (user != null) {
        loading.value = false;
        Modular.to.navigate('/home/', arguments: user);
      } else {
        loading.value = false;
        Modular.to.navigate('/onboarding');
      }
    } catch (e) {
      loading.value = false;

      Modular.to.navigate('/onboarding');
    }
  }

  bool showAndHidePassword() {
    showPassword.value = !showPassword.value;
    update();

    return showPassword.value;
  }
}

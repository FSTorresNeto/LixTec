Map<String, dynamic> nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return {'isValid': false, 'error': 'Digite seu nome'};
  }

  final names = name.split(' ');

  if (names.length == 1)
    return {'isValid': false, 'error': 'Digite seu nome completo!'};

  if (name.length <= 7)
    return {'isValid': false, 'error': 'Nome muito pequeno!'};

  return {'isValid': true, 'error': null};
}

Map<String, dynamic> emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return {'isValid': false, 'error': 'Digite seu e-mail'};
  }

  final exp = RegExp(r"^([\w\.-_]+)(@+)([\w]+)((\.+\w{2,3}){1,2})$");

  if (!exp.hasMatch(email)) {
    return {'isValid': false, 'error': 'Email inválido!'};
  }

  return {'isValid': true, 'error': null};
}

Map<String, dynamic> passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return {'isValid': false, 'error': 'Digite sua senha'};
  }

  if (password.length <= 7) {
    return {
      'isValid': false,
      'error': 'A senha deve ter pelo menos 8 caracteres'
    };
  }

  return {'isValid': true, 'error': null};
}

bool formOnboardingValidator(String? password, String? email, String? name) {
  final nameValidation = nameValidator(name);
  final emailValidation = emailValidator(email);
  final passwordValidation = passwordValidator(password);

  if (!nameValidation['isValid'] ||
      !emailValidation['isValid'] ||
      !passwordValidation['isValid']) {
    return false;
  }

  return true;
}

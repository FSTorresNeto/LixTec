dynamic storagePassword = "";

String? nameValidator(name) {
  if (name == null || name.isEmpty) {
    return "Digite seu nome";
  }

  final names = name.split(' ');

  if (names.length == 1) {
    return 'Digite seu nome completo!';
  }

  if (name.length <= 7) {
    return 'Nome muito pequeno!';
  }

  return null;
}

String? emailValidator(email) {
  if (email == null || email.isEmpty) {
    return "Digite seu e-mail";
  }

  final exp = RegExp(r"^([\w\.-_]+)(@+)([\w]+)((\.+\w{2,3}){1,2})$");

  if (!exp.hasMatch(email ?? '')) {
    return 'Email invalido!';
  }

  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return "Digite sua senha";
  }

  if (password.length <= 7) {
    return "A senha deve ter pelo menos 8 caracteres";
  }

  storagePassword = password;

  return null;
}

bool formOnboardingValidator(password, email, name) {
  if (password == null || password.isEmpty) {
    return false;
  }

  if (email == null || email.isEmpty) {
    return false;
  }

  if (name == null || name.isEmpty) {
    return false;
  }

  if (password.length <= 7) {
    return false;
  }

  return true;
}

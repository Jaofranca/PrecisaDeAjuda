String validateAll(
    {required String email,
    required String password,
    required String cpf,
    required String name,
    required String phoneNumber}) {
  if (emailValidator(email) != "Success") {
    return emailValidator(email);
  }
  if (passwordValidator(password) != "Success") {
    return passwordValidator(password);
  }
  if (cpfValidator(cpf) != "Success") {
    return cpfValidator(cpf);
  }
  if (nameValidator(name) != "Success") {
    return nameValidator(name);
  }
  if (phoneValidator(phoneNumber) != "Success") {
    return phoneValidator(phoneNumber);
  }
  return "Success";
}

String validateModifyUserData(
    {required String email,
    required String cpf,
    required String name,
    required String phoneNumber}) {
  if (emailValidator(email) != "Success") {
    return emailValidator(email);
  }
  if (cpfValidator(cpf) != "Success") {
    return cpfValidator(cpf);
  }
  if (nameValidator(name) != "Success") {
    return nameValidator(name);
  }
  if (phoneValidator(phoneNumber) != "Success") {
    return phoneValidator(phoneNumber);
  }
  return "Success";
}

String emailValidator(String? value) {
  if (value == null || value.isEmpty) return "Campo email vazio";
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (!emailValid) "email inválido";
  return "Success";
}

String nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo nome vazio";
  }
  return "Success";
}

String phoneValidator(String? value) {
  if (value == null || value.isEmpty) return "Campo telefone vazio";
  if (value.length < 11) return "telefone precisa ter 11 dígitos";
  if (value[5] != '9') return "Primeiro dígito 9 não encontrado";
  return "Success";
}

String passwordValidator(String? value) {
  if (value == null || value.isEmpty) return "Campo senha vazio";
  if (value.length < 6) return "Senha precisa ter no mínimo 6 dígitos";
  return "Success";
}

String cpfValidator(String? value) {
  if (value == null || value.isEmpty) return "Campo cpf vazio";

  if (value.length < 8) return "Campo cpf de tamanho inválido";

  return "Success";
}

class UserModel {
  final String userEmail;
  final bool? completedRegistration;
  final String? cpf;
  final bool? isPrestador;
  final String? name;
  final String? ocupation;
  final String? phoneNumber;
  final String uuid;

  UserModel({
    required this.uuid,
    required this.userEmail,
    this.completedRegistration,
    this.cpf,
    this.isPrestador,
    this.name,
    this.ocupation,
    this.phoneNumber,
  });
}

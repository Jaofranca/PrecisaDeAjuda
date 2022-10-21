// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? userEmail;
  final bool? completedRegistration;
  final String? cpf;
  final bool? isPrestador;
  final String? name;
  final String? ocupation;
  final String? phoneNumber;
  final String? uuid;

  UserModel({
    this.uuid,
    required this.userEmail,
    this.completedRegistration,
    this.cpf,
    this.isPrestador,
    this.name,
    this.ocupation,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userEmail': userEmail,
      'completedRegistration': completedRegistration,
      'cpf': cpf,
      'isPrestador': isPrestador,
      'name': name,
      'ocupation': ocupation,
      'phoneNumber': phoneNumber,
      'uuid': uuid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      completedRegistration: map['completedRegistration'] != null
          ? map['completedRegistration'] as bool
          : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      isPrestador:
          map['isPrestador'] != null ? map['isPrestador'] as bool : null,
      name: map['name'] != null ? map['name'] as String : null,
      ocupation: map['ocupation'] != null ? map['ocupation'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

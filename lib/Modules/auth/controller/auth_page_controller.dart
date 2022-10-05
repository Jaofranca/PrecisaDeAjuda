import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:precisa_de_ajuda/Modules/auth/user_model.dart';
import 'package:precisa_de_ajuda/Modules/auth/utils/firebase_errors.dart';

part 'auth_page_controller.g.dart';

class AuthPageController = _AuthPageControllerBase with _$AuthPageController;

abstract class _AuthPageControllerBase with Store {
  _AuthPageControllerBase();

  @observable
  String userEmail = " ";

  @observable
  String userPassword = " ";

  @observable
  String userUuid = " ";

  @action
  void setUserEmail(String email) {
    userEmail = email;
  }

  @action
  void setUserPassword(String password) {
    userPassword = password;
  }

  @action
  void setUserUuid(String uid) {
    userUuid = uid;
  }

  @action
  Future<String> updateUser(UserModel user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userUuid).set({
        "name": user.name,
        "email": user.userEmail,
        "completed_registration": true,
        "cpf": user.cpf,
        "is_prestador": false,
        "phone_number": user.phoneNumber,
        "ocupation": user.ocupation,
        "photo": " ",
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      returnFirebaseError(e);
      return e.toString();
    }
  }

  @action
  Future<String> createUser() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      final user = userCredential.user;
      setUserUuid(userCredential.user!.uid);
      // await user!.sendEmailVerification();
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        "name": "joao",
        "email": userEmail,
        "completed_registration": false,
        "cpf": "00000000000",
        "is_prestador": false,
        "phone_number": 123456,
        "ocupation": "",
        "photo": " ",
      });
      return "success";
    } on FirebaseAuthException catch (e) {
      returnFirebaseError(e);
      return e.toString();
    }
  }

  @action
  Future<String> logInUser() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      setUserUuid(userCredential.user!.uid);

      return "success";
    } on FirebaseAuthException catch (e) {
      returnFirebaseError(e);
      return e.toString();
    }
  }
}

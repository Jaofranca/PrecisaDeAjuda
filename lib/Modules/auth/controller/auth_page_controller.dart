import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:precisa_de_ajuda/Modules/auth/models/user_model.dart';
import 'package:precisa_de_ajuda/Modules/auth/utils/firebase_errors.dart';

part 'auth_page_controller.g.dart';

class AuthController = _AuthPageControllerBase with _$AuthPageController;

abstract class _AuthPageControllerBase with Store {
  _AuthPageControllerBase();

  @observable
  UserModel actualUser = UserModel(
    userEmail: " ",
  );

  @observable
  String userPassword = " ";

  @observable
  String userUuid = " ";

  @action
  void setUserPassword(String password) {
    userPassword = password;
  }

  @action
  void setUserUuid(String uid) {
    userUuid = uid;
  }

  @action
  void setUser(UserModel? usermodel) {
    actualUser = usermodel!;
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
  Future<UserModel?> initUser() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserModel(
            name: data['name'],
            userEmail: data['email'],
            completedRegistration: data['completed_registration'],
            cpf: data['cpf'],
            isPrestador: data['is_prestador'],
            phoneNumber: data['phone_number'],
            ocupation: data['ocupation'],
            uuid: user.uid);
      },
    );
    return null;
  }

  @action
  Future<String> createUser() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: actualUser.userEmail,
        password: userPassword,
      );
      final user = userCredential.user;
      setUserUuid(userCredential.user!.uid);
      // await user!.sendEmailVerification();
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        "name": actualUser.name,
        "email": actualUser.userEmail,
        "completed_registration": true,
        "cpf": actualUser.cpf,
        "is_prestador": actualUser.isPrestador,
        "phone_number": actualUser.phoneNumber,
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
        email: actualUser.userEmail,
        password: userPassword,
      );
      setUserUuid(userCredential.user!.uid);
      setUser(await initUser());
      return "success";
    } on FirebaseAuthException catch (e) {
      returnFirebaseError(e);
      return e.toString();
    }
  }
}

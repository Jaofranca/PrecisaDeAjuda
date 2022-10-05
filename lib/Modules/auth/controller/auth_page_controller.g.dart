// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthPageController on _AuthPageControllerBase, Store {
  late final _$actualUserAtom =
      Atom(name: '_AuthPageControllerBase.actualUser', context: context);

  @override
  UserModel get actualUser {
    _$actualUserAtom.reportRead();
    return super.actualUser;
  }

  @override
  set actualUser(UserModel value) {
    _$actualUserAtom.reportWrite(value, super.actualUser, () {
      super.actualUser = value;
    });
  }

  late final _$userPasswordAtom =
      Atom(name: '_AuthPageControllerBase.userPassword', context: context);

  @override
  String get userPassword {
    _$userPasswordAtom.reportRead();
    return super.userPassword;
  }

  @override
  set userPassword(String value) {
    _$userPasswordAtom.reportWrite(value, super.userPassword, () {
      super.userPassword = value;
    });
  }

  late final _$userUuidAtom =
      Atom(name: '_AuthPageControllerBase.userUuid', context: context);

  @override
  String get userUuid {
    _$userUuidAtom.reportRead();
    return super.userUuid;
  }

  @override
  set userUuid(String value) {
    _$userUuidAtom.reportWrite(value, super.userUuid, () {
      super.userUuid = value;
    });
  }

  late final _$updateUserAsyncAction =
      AsyncAction('_AuthPageControllerBase.updateUser', context: context);

  @override
  Future<String> updateUser(UserModel user) {
    return _$updateUserAsyncAction.run(() => super.updateUser(user));
  }

  late final _$initUserAsyncAction =
      AsyncAction('_AuthPageControllerBase.initUser', context: context);

  @override
  Future<UserModel?> initUser() {
    return _$initUserAsyncAction.run(() => super.initUser());
  }

  late final _$createUserAsyncAction =
      AsyncAction('_AuthPageControllerBase.createUser', context: context);

  @override
  Future<String> createUser() {
    return _$createUserAsyncAction.run(() => super.createUser());
  }

  late final _$logInUserAsyncAction =
      AsyncAction('_AuthPageControllerBase.logInUser', context: context);

  @override
  Future<String> logInUser() {
    return _$logInUserAsyncAction.run(() => super.logInUser());
  }

  late final _$_AuthPageControllerBaseActionController =
      ActionController(name: '_AuthPageControllerBase', context: context);

  @override
  void setUserPassword(String password) {
    final _$actionInfo = _$_AuthPageControllerBaseActionController.startAction(
        name: '_AuthPageControllerBase.setUserPassword');
    try {
      return super.setUserPassword(password);
    } finally {
      _$_AuthPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserUuid(String uid) {
    final _$actionInfo = _$_AuthPageControllerBaseActionController.startAction(
        name: '_AuthPageControllerBase.setUserUuid');
    try {
      return super.setUserUuid(uid);
    } finally {
      _$_AuthPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserModel? usermodel) {
    final _$actionInfo = _$_AuthPageControllerBaseActionController.startAction(
        name: '_AuthPageControllerBase.setUser');
    try {
      return super.setUser(usermodel);
    } finally {
      _$_AuthPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualUser: ${actualUser},
userPassword: ${userPassword},
userUuid: ${userUuid}
    ''';
  }
}

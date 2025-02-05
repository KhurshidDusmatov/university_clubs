import 'package:hive_flutter/hive_flutter.dart';
import 'auth_holder.dart';

class AuthPrefs extends AuthHolder {
  late Box authBox;

  AuthPrefs() {
    authBox = Hive.box(authBoxID);
  }

  @override
  String get authToken => authBox.get(authTokenId, defaultValue: '');

  @override
  set authToken(String token) => authBox.put(authTokenId, token);

  @override
  String get name => authBox.get(nameId, defaultValue: '');

  @override
  set name(String name) => authBox.put(nameId, name);

  @override
  String get surname => authBox.get(surnameId, defaultValue: '');

  @override
  set surname(String surname) => authBox.put(surnameId, '');

  @override
  String get phone => authBox.get(phoneId, defaultValue: '');

  @override
  set phone(String name) => authBox.put(phoneId, name);


  @override
  String get role => authBox.get(roleId, defaultValue: '');


  @override
  set role(String role) => authBox.put(roleId, role);

  @override
  Future<void> clearAuth() async => await authBox.clear();

  static const authBoxID = 'auth_hive_box';
  static const authTokenId = 'authToken';
  static const nameId = 'name';
  static const surnameId = 'surname';
  static const phoneId = 'phone';
  static const roleId = 'role';
}

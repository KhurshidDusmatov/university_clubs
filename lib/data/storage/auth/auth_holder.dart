

abstract class AuthHolder {
  late String authToken;
  late String name;
  late String surname;
  late String phone;
  late String role;

  Future<void> clearAuth();
}

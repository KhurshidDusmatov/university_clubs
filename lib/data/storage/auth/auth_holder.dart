

abstract class AuthHolder {
  late String authToken;
  late String name;
  late String surname;
  late String phone;
  late List<String> roleList;

  Future<void> clearAuth();
}

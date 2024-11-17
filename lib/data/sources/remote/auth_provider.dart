class AuthProvider {
  const AuthProvider();

  Future<bool> authenticate(String email, String password) async {
    return Future.delayed(Duration(seconds: 2), () {
      return true;
    });
  }
}

abstract class IAuthService {
  Future<bool> authenticate(String email, String password);
}

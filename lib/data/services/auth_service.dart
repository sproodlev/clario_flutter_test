import 'package:fluttertest/data/sources/remote/auth_provider.dart';
import 'package:fluttertest/domain/services_interfaces/auth_service_interface.dart';

class AuthService implements IAuthService {
  final AuthProvider _authProvider;

  const AuthService(this._authProvider);

  @override
  Future<bool> authenticate(String email, String password) async {
    return await _authProvider.authenticate(email, password);
  }
}

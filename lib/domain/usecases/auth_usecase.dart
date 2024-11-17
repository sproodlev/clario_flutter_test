import 'package:fluttertest/domain/services_interfaces/auth_service_interface.dart';

class AuthUsecase {
  final IAuthService service;

  const AuthUsecase(this.service);

  Future<bool> authenticate(String email, String password) async {
    return await service.authenticate(email, password);
  }
}

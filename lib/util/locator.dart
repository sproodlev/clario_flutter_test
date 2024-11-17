import 'package:fluttertest/data/services/auth_service.dart';
import 'package:fluttertest/data/sources/remote/auth_provider.dart';
import 'package:fluttertest/domain/services_interfaces/auth_service_interface.dart';
import 'package:fluttertest/domain/usecases/auth_usecase.dart';
import 'package:fluttertest/presentation/auth/auth_cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Data providers
  locator.registerFactory<AuthProvider>(() => AuthProvider());

  // Services
  locator.registerFactory<IAuthService>(() => AuthService(locator<AuthProvider>()));

  // Use cases
  locator.registerFactory<AuthUsecase>(() => AuthUsecase(locator<IAuthService>()));

  // Cubits
  locator.registerFactory<AuthCubit>(() => AuthCubit(locator<AuthUsecase>()));
}

import 'package:bloc/bloc.dart';
import 'package:fluttertest/domain/usecases/auth_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUseCase;

  AuthCubit(this.authUseCase) : super(AuthState.initial());

  Future<void> authenticate(String email, String password) async {
    emit(AuthState.loading());

    try {
      bool authResult = await authUseCase.authenticate(email, password);

      if (authResult) {
        emit(AuthState.success());
        return;
      } else {
        emit(AuthState.failed());
      }
    } on Exception catch (_) {
      emit(AuthState.failed());
    }
  }
}

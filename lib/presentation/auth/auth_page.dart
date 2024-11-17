import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/presentation/auth/auth_cubit/auth_cubit.dart';
import 'package:fluttertest/presentation/auth/auth_view.dart';
import 'package:fluttertest/util/locator.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => locator<AuthCubit>(),
      child: const AuthView(),
    );
  }
}

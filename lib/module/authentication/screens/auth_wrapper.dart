import 'package:ex2/injection.dart';
import 'package:ex2/module/authentication/cubit/auth_cubit.dart';
import 'package:ex2/module/authentication/cubit/auth_state.dart';
import 'package:ex2/module/authentication/screens/authentication.dart';
import 'package:ex2/module/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>()..checkAuth(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state is AuthAuthenticated) {
            return HomeScreen();
          }
          return Authentication();
        },
      ),
    );
  }
}

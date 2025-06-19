import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/auth/domain/usecase/login_usecase.dart';
import 'package:nawel_application/Features/auth/domain/usecase/signup_usecase.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_bloc.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/login_body.dart';
import 'package:nawel_application/core/di/injection.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(loginUseCase: sl(), registerUseCase: sl()),
      child: SafeArea(
        child: Scaffold(backgroundColor: Colors.white, body: LoginBody()),
      ),
    );
  }
}

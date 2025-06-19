import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_bloc.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_event.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_state.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/auth_button.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/auth_field.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/auth_textbutton.dart';
import 'package:nawel_application/core/routing/app_routes.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/assets.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    AppSizes.init(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Login successful!",
                style: TextStyle(color: Colors.green),
              ),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, Routes.mainlayout);
          });
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.screenHeight * 0.1),
          child: Column(
            children: [
              Center(child: Image.asset(AssetsData.logo)),

              AuthField(
                controller: emailController,
                hintText: 'mail',
                prefixIcon: const Icon(Icons.mail_outline),
              ),
              SizedBox(height: AppSizes.screenHeight * 0.01),
              AuthField(
                isPassword: true,
                controller: passwordController,
                hintText: 'password',
                prefixIcon: const Icon(Icons.lock_outlined),
              ),

              SizedBox(height: AppSizes.screenHeight * 0.03),
              AuthButton(
                text: 'Log In',
                onPressed: () {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (email.isNotEmpty && password.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      LoginEvent(email: email, password: password),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields.')),
                    );
                  }
                },
              ),
              AuthTextbutton(
                buttontext: ' create an account',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.signup);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

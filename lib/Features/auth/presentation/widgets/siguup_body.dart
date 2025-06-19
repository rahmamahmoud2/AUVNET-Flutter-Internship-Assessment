import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_bloc.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_event.dart';
import 'package:nawel_application/Features/auth/presentation/controllers/bloc/auth_state.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/auth_button.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/auth_field.dart';
import 'package:nawel_application/Features/auth/presentation/widgets/auth_textbutton.dart';
import 'package:nawel_application/core/routing/app_router.dart';
import 'package:nawel_application/core/routing/app_routes.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/assets.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                "Sign up successfully!",

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
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.screenHeight * 0.08),
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
              SizedBox(height: AppSizes.screenHeight * 0.01),
              AuthField(
                isPassword: true,
                controller: confirmPasswordController,
                hintText: 'confirm password',
                prefixIcon: const Icon(Icons.lock_outlined),
              ),
              SizedBox(height: AppSizes.screenHeight * 0.03),
              AuthButton(
                text: 'Sign Up',
                onPressed: () {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  if (email.isNotEmpty && password.isNotEmpty) {
                    context.read<AuthBloc>().add(
                      SignUpEvent(email: email, password: password),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter email and password'),
                      ),
                    );
                  }
                },
              ),
              AuthTextbutton(
                text: ' have an account?',
                buttontext: ' Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/views/onboarding_screen.dart';
import 'package:nawel_application/Features/auth/presentation/views/login_screen.dart';
import 'package:nawel_application/Features/auth/presentation/views/signup_screen.dart';
import 'package:nawel_application/Features/home/presentation/views/homescreen.dart';
import 'package:nawel_application/Features/home/presentation/views/main_layout.dart';

import 'package:nawel_application/Features/splash/presentation/views/splash_screen.dart';
import 'package:nawel_application/core/routing/app_routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.mainlayout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:nawel_application/Features/splash/presentation/views/widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SplashScreenBody(),
      ),
    );
  }
}

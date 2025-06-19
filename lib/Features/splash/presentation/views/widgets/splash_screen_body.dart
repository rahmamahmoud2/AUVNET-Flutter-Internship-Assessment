import 'package:flutter/material.dart';
import 'package:nawel_application/Features/splash/presentation/views/widgets/logo_sliding.dart';
import 'package:nawel_application/core/routing/app_routes.dart';
import 'package:nawel_application/core/utils/assets.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward().whenComplete(() {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [LogoSliding(slidingAnimation: slidingAnimation)],
      ),
    );
  }
}

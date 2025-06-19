import 'package:flutter/material.dart';
import 'package:nawel_application/core/utils/assets.dart';

class LogoSliding extends StatelessWidget {
  const LogoSliding({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset(AssetsData.logo),
        );
      },
    );
  }
}

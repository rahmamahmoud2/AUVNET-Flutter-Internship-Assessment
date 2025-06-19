import 'package:flutter/material.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8900FE),
        minimumSize: Size(
          AppSizes.screenWidth * 0.92,
          AppSizes.screenHeight * 0.065,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'dmsans',
          fontSize: 16,

          color: Colors.white,
        ),
      ),
    );
  }
}

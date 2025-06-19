import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  const HomeText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}

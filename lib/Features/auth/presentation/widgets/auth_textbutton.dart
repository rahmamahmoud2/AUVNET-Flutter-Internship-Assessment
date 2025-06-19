import 'package:flutter/material.dart';

class AuthTextbutton extends StatelessWidget {
  final String? text;
  final String buttontext;
  final VoidCallback onPressed;
  const AuthTextbutton({
    super.key,
    required this.buttontext,
    this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text ?? '',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'dmsans',
            fontWeight: FontWeight.bold,

            color: Color(0xFF1877F2),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(0, 50),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            buttontext,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'dmsans',
              fontWeight: FontWeight.bold,
              color: Color(0xFF1877F2),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final bool isPassword;

  const AuthField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Container(
      width: AppSizes.screenWidth * 0.8,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? isObscure : false,

        decoration: InputDecoration(
          suffixIcon:
              widget.isPassword
                  ? IconButton(
                    icon: Icon(
                      color: Color(0x4D000000),
                      isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  )
                  : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0x80000000),
            fontSize: 16,
            fontFamily: 'mulish',
          ),
          prefixIcon: Icon(
            widget.prefixIcon.icon,
            size: 24,
            color: Color(0x4D000000),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0x33C4C4C4),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: Color(0x33C4C4C4),
        ),
      ),
    );
  }
}

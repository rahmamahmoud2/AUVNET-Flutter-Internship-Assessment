import 'package:flutter/material.dart';
import 'package:nawel_application/core/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(child: Text('Profile will be displayed here')),
    );
  }
}

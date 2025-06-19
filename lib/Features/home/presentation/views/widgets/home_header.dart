import 'package:flutter/material.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Container(
      height: AppSizes.screenHeight * 0.2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Delivering to",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                "Hi Hepa!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubikbold',
                ),
              ),
            ],
          ),

          // Profile Image
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=65', // صورة مؤقتة
            ),
          ),
        ],
      ),
    );
  }
}

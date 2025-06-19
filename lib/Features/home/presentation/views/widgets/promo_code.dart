import 'package:flutter/material.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/assets.dart';
import 'package:nawel_application/core/utils/colors.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: AppSizes.screenHeight * 0.08,
            width: AppSizes.screenHeight * 0.1,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              AssetsData.promo,
              height: AppSizes.screenHeight * 0.09,
              width: AppSizes.screenHeight * 0.1,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Got a code ! ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontFamily: 'dmsans',
                ),
              ),
              Text(
                'Add your code and save on your order',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'dmsans',
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

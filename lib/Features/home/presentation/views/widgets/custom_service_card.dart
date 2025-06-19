import 'package:flutter/material.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/colors.dart';

class ServiceCard extends StatelessWidget {
  final MainService service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    final cardWidth = AppSizes.screenWidth * 0.3;
    final imageSize = cardWidth;

    return SizedBox(
      width: cardWidth,
      child: Column(
        children: [
          Container(
            height: imageSize,
            width: imageSize,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(service.imageUrl, fit: BoxFit.cover),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              service.description,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'dmsans',
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Text(
            service.name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'dmsans',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

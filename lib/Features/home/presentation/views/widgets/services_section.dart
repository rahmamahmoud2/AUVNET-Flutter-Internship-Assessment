import 'package:flutter/material.dart';
import 'package:nawel_application/Features/home/domain/entities/services.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/custom_service_card.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';

class ServicesSection extends StatelessWidget {
  final List<MainService> services;

  const ServicesSection({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return SizedBox(
      height: AppSizes.screenHeight * 0.2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: services.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceCard(service: service);
        },
      ),
    );
  }
}

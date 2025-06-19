import 'package:flutter/material.dart';
import 'package:nawel_application/Features/home/domain/entities/home_item.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/assets.dart';

final List<HomeItem> shortcutItems = [
  HomeItem(title: "Past orders", image: AssetsData.note),
  HomeItem(title: "Super saver", image: AssetsData.logo),
  HomeItem(title: "Give back", image: AssetsData.giveback),
  HomeItem(title: "Best Sellers", image: AssetsData.star),
];

class ShortcutSection extends StatelessWidget {
  const ShortcutSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return SizedBox(
      height: AppSizes.screenHeight * 0.135,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: shortcutItems.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder:
            (context, index) => HomeItemCard(item: shortcutItems[index]),
      ),
    );
  }
}

class HomeItemCard extends StatelessWidget {
  final HomeItem item;

  const HomeItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSizes.screenHeight * 0.09,
          width: AppSizes.screenWidth * 0.2,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEEE6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(item.image, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

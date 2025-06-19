import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_state.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Text("Error: ${state.error}");
        } else {
          final banners = state.banners;

          return Column(
            children: [
              SizedBox(
                height: AppSizes.screenHeight * 0.25,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: banners.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = banners[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          banner.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(banners.length, (index) {
                  final isActive = index == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
            ],
          );
        }
      },
    );
  }
}

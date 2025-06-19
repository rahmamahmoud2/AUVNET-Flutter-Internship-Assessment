import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/Data/models/onboarding_model.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_bloc.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_event.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_state.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';
import 'package:nawel_application/core/utils/assets.dart';
import 'package:nawel_application/core/routing/app_routes.dart';

class OnboardingBody extends StatelessWidget {
  final OnboardingModel model;
  final PageController controller;

  const OnboardingBody({
    super.key,
    required this.model,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Transform.translate(
              offset: const Offset(-104, -20),
              child: Image.asset(
                AssetsData.onboardingEllipse,
                height: 342,
                width: 342,
              ),
            ),
            Transform.translate(
              offset: const Offset(1, 91),
              child: Image.asset(AssetsData.logo, height: 336, width: 336),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              model.title,
              style: const TextStyle(fontFamily: 'RubikBold', fontSize: 28),
            ),
            SizedBox(height: AppSizes.screenHeight * 0.01),
            Text(
              model.description,
              style: const TextStyle(
                fontFamily: 'RubikRegular',
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),

        BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signup);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8900FE),
                    minimumSize: Size(
                      AppSizes.screenWidth * 0.8,
                      AppSizes.screenHeight * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontFamily: 'RubikRegular',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.screenHeight * 0.01),
                TextButton(
                  onPressed: () {
                    if (state.currentPage < OnboardingModel.pages.length - 1) {
                      context.read<OnboardingBloc>().add(NextPageEvent());
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, Routes.signup);
                    }
                  },
                  child: Text(
                    'next',
                    style: TextStyle(
                      fontFamily: 'RubikRegular',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.screenHeight * 0.04),
              ],
            );
          },
        ),
      ],
    );
  }
}

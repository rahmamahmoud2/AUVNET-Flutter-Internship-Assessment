import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/Data/models/onboarding_model.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_bloc.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_state.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/views/widgets/onboarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return PageView.builder(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: OnboardingModel.pages.length,
                itemBuilder: (context, index) {
                  return OnboardingBody(
                    model: OnboardingModel.pages[index],
                    controller: controller,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

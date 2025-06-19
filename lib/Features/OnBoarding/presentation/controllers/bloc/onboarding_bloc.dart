import 'package:bloc/bloc.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_event.dart';
import 'package:nawel_application/Features/OnBoarding/presentation/controllers/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(currentPage: 0)) {
    on<NextPageEvent>((event, emit) {
      if (state.currentPage < 2) {
        emit(OnboardingState(currentPage: state.currentPage + 1));
      }
    });

    on<SetPageEvent>((event, emit) {
      emit(OnboardingState(currentPage: event.page));
    });
  }
}

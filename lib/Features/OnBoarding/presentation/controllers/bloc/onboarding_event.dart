abstract class OnboardingEvent {}

class NextPageEvent extends OnboardingEvent {}

class SetPageEvent extends OnboardingEvent {
  final int page;
  SetPageEvent(this.page);
}

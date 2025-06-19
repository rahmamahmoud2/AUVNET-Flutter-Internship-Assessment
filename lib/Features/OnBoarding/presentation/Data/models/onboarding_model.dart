class OnboardingModel {
  final String title;
  final String description;

  OnboardingModel({required this.title, required this.description});
  static List<OnboardingModel> pages = [
    OnboardingModel(
      title: "all-in-one delivery",
      description:
          "Order groceries, medicines, and meals\n\t\t\t\t\t\t\t\t\tdelivered straight to your door",
    ),
    OnboardingModel(
      title: "User-to-User Delivery",
      description:
          "Send or receive items from other users quickly \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tand easily",
    ),
    OnboardingModel(
      title: "Sales & Discounts",
      description: "Discover exclusive sales and deals every day",
    ),
  ];
}

class HomeNavState {
  final int currentIndex;

  HomeNavState({required this.currentIndex});

  HomeNavState copyWith({int? currentIndex}) {
    return HomeNavState(currentIndex: currentIndex ?? this.currentIndex);
  }
}

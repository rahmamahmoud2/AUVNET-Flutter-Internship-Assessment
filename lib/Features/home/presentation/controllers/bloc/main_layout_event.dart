abstract class HomeNavEvent {}

class ChangeTabEvent extends HomeNavEvent {
  final int newIndex;

  ChangeTabEvent(this.newIndex);
}

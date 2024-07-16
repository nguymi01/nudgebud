part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent {}
class HomepageClickButtonTestEvent extends HomepageEvent{}
class HomepageEventClickStatus extends HomepageEvent{
  HomepageEventClickStatus(this.status);
  final bool status;
}
class HomepageEventClickTab extends HomepageEvent{
  HomepageEventClickTab(this.index);
  final int index;
}

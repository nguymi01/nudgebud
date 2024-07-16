part of 'homepage_bloc.dart';

@immutable
sealed class HomepageState {}

final class HomepageInitial extends HomepageState {}
class HomepageStateShowPopUp extends HomepageState{}
class HomepageStateStatusUpdated extends HomepageState{
  HomepageStateStatusUpdated(this.status);
  final bool status;
}
class HomepageStateUpdateIndex extends HomepageState{
  final int index;
  HomepageStateUpdateIndex(this.index);
}
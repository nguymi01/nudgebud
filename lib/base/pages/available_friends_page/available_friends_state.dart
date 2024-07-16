part of 'available_friends_bloc.dart';

@immutable
sealed class AvailableFriendsState {}

final class AvailableFriendsInitial extends AvailableFriendsState {}

class AvailableFriendsStateLoadData extends AvailableFriendsState {
  AvailableFriendsStateLoadData( this.friends);

  final List<dynamic> friends;
}

class AvailableFriendsStateShowDistance extends AvailableFriendsState {
  AvailableFriendsStateShowDistance(this.selected, this.time);

  final DateTime time;
  final String selected;
}

class AvailableFriendsStateUpdateTime extends AvailableFriendsState {
  AvailableFriendsStateUpdateTime(this.time);

  final DateTime time;
}

part of 'available_friends_bloc.dart';

@immutable
sealed class AvailableFriendsEvent {}

class AvailableFriendsEventSelectDistance extends AvailableFriendsEvent {
  AvailableFriendsEventSelectDistance( {required this.selected,required this.time});

  final String selected;
  final DateTime time;
}

class AvailableFriendsEventSelectTime extends AvailableFriendsEvent {
  AvailableFriendsEventSelectTime({required this.time});

  final DateTime time;
}

class AvailableFriendsEventCallData extends AvailableFriendsEvent{

}
part of 'friend_card_bloc.dart';

@immutable
sealed class FriendCardState {}

final class FriendCardInitial extends FriendCardState {}

class FriendCardStateSelected extends FriendCardState {
  final bool checked;

  FriendCardStateSelected(this.checked);
}

part of 'friend_card_bloc.dart';

@immutable
sealed class FriendCardEvent {}

class FriendCardEventSelect extends FriendCardEvent {
  final bool select;

  FriendCardEventSelect(this.select);
}

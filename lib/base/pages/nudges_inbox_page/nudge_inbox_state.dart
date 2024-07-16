part of 'nudge_inbox_bloc.dart';

@immutable
sealed class NudgeInboxState {}

final class NudgeInboxInitial extends NudgeInboxState {}

class NudgeInboxStateReceived extends NudgeInboxState {}

class NudgeInboxStateSent extends NudgeInboxState {}

class NudgeInboxStateDisplayOption extends NudgeInboxState {
  final String type;

  NudgeInboxStateDisplayOption(this.type);
}

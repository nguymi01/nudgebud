part of 'nudge_inbox_bloc.dart';

@immutable
sealed class NudgeInboxEvent {}

class NudgeInboxEventClickReceivedTab extends NudgeInboxEvent {}

class NudgeInboxEventClickSentTab extends NudgeInboxEvent {}

class NudgeInboxEventClickOption extends NudgeInboxEvent {
  final String type;

  NudgeInboxEventClickOption(this.type);
}

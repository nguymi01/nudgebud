part of 'nudge_filter_bloc.dart';

@immutable
sealed class NudgeFilterEvent {}
class NudgeFilterEventClickButton extends NudgeFilterEvent{
  final String value;

  NudgeFilterEventClickButton({required this.value});
}
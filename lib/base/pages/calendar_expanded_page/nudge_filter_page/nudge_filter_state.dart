part of 'nudge_filter_bloc.dart';

@immutable
sealed class NudgeFilterState {}

final class NudgeFilterInitial extends NudgeFilterState {}

class NudgeFilterStateShowChosenValue extends NudgeFilterState {
  final String value;

  NudgeFilterStateShowChosenValue({required this.value});
}

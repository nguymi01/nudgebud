part of 'calendar_expanded_bloc.dart';

@immutable
sealed class CalendarExpandedState {}

final class CalendarExpandedInitial extends CalendarExpandedState {}
class CalendarExpandedStateShowDate extends CalendarExpandedState{
  CalendarExpandedStateShowDate({required this.date});
  final DateTime date;
}

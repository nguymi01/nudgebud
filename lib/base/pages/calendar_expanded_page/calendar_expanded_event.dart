part of 'calendar_expanded_bloc.dart';

@immutable
sealed class CalendarExpandedEvent {}

class CalendarExpandedEventChooseDate extends CalendarExpandedEvent {
  final DateTime date;

  CalendarExpandedEventChooseDate({required this.date});
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_expanded_event.dart';

part 'calendar_expanded_state.dart';

class CalendarExpandedBloc
    extends Bloc<CalendarExpandedEvent, CalendarExpandedState> {
  CalendarExpandedBloc() : super(CalendarExpandedInitial()) {
    on<CalendarExpandedEvent>((event, emit) {
      if (event is CalendarExpandedEventChooseDate) {
        emit(CalendarExpandedStateShowDate(date: event.date));
      }
    });
  }
}

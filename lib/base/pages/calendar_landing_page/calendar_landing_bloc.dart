import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_landing_event.dart';
part 'calendar_landing_state.dart';

class CalendarLandingBloc extends Bloc<CalendarLandingEvent, CalendarLandingState> {
  CalendarLandingBloc() : super(CalendarLandingInitial()) {
    on<CalendarLandingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_rsvp_details_event.dart';

part 'event_rsvp_details_state.dart';

class EventRsvpDetailsBloc
    extends Bloc<EventRsvpDetailsEvent, EventRsvpDetailsState> {
  EventRsvpDetailsBloc() : super(EventRsvpDetailsInitial()) {
    on<EventRsvpDetailsEvent>((event, emit) {
      if (event is EventRsvpDetailsEventClickOption) {
        emit(EventRsvpDetailsStateDisplayOption(type: event.type));
      }
    });
  }
}

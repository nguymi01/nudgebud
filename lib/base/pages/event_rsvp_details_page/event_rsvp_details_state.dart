part of 'event_rsvp_details_bloc.dart';

@immutable
sealed class EventRsvpDetailsState {}

final class EventRsvpDetailsInitial extends EventRsvpDetailsState {}

class EventRsvpDetailsStateDisplayOption extends EventRsvpDetailsState {
  final String type;

  EventRsvpDetailsStateDisplayOption({required this.type});
}

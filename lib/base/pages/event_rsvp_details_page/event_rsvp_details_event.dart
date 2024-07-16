part of 'event_rsvp_details_bloc.dart';

@immutable
sealed class EventRsvpDetailsEvent {}

class EventRsvpDetailsEventClickOption extends EventRsvpDetailsEvent {
  final String type;

  EventRsvpDetailsEventClickOption({required this.type});
}

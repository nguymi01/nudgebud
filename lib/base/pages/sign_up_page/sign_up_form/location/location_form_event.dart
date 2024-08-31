part of 'location_form_bloc.dart';

@immutable
sealed class LocationFormEvent {}
class LocationFormEventSelectDate extends LocationFormEvent{
  final String country;

  LocationFormEventSelectDate(this.country);
}
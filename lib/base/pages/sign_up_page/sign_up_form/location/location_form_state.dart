part of 'location_form_bloc.dart';

@immutable
sealed class LocationFormState {}

final class LocationFormInitial extends LocationFormState {}
class LocationFormStateDisplayCountry extends LocationFormState{
  final String country;

  LocationFormStateDisplayCountry(this.country);
}
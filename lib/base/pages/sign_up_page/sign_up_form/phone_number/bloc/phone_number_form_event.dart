part of 'phone_number_form_bloc.dart';

sealed class PhoneNumberFormEvent extends Equatable {
  const PhoneNumberFormEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberFormEventSelectCountry extends PhoneNumberFormEvent {
  final String country;

  PhoneNumberFormEventSelectCountry(this.country);
}

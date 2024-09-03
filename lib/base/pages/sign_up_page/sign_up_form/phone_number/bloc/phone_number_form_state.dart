part of 'phone_number_form_bloc.dart';

sealed class PhoneNumberFormState extends Equatable {
  const PhoneNumberFormState();

  @override
  List<Object> get props => [];
}

final class PhoneNumberFormInitial extends PhoneNumberFormState {}

class PhoneNumberFormStateDisplayCountry extends PhoneNumberFormState {
  final String country;

  PhoneNumberFormStateDisplayCountry(this.country);
}

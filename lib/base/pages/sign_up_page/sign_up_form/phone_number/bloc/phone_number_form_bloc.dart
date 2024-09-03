import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_number_form_event.dart';
part 'phone_number_form_state.dart';

class PhoneNumberFormBloc
    extends Bloc<PhoneNumberFormEvent, PhoneNumberFormState> {
  PhoneNumberFormBloc() : super(PhoneNumberFormInitial()) {
    on<PhoneNumberFormEvent>((event, emit) {
      if (event is PhoneNumberFormEventSelectCountry) {
        emit(PhoneNumberFormStateDisplayCountry(event.country));
      }
    });
  }
}

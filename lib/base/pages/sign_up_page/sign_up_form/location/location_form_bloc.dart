import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'location_form_event.dart';
part 'location_form_state.dart';

class LocationFormBloc extends Bloc<LocationFormEvent, LocationFormState> {
  LocationFormBloc() : super(LocationFormInitial()) {
    on<LocationFormEvent>((event, emit) {
      if (event is LocationFormEventSelectDate){
        emit(LocationFormStateDisplayCountry(event.country));
      }
    });
  }
}

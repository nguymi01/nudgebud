import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gender_form_event.dart';
part 'gender_form_state.dart';

class GenderFormBloc extends Bloc<GenderFormEvent, GenderFormState> {
  GenderFormBloc() : super(GenderFormInitial()) {
    on<GenderFormEvent>((event, emit) {
      if(event is GenderFormEventClickButton){
        emit(GenderFormStateChosen(event.gender));
      }
    });
  }
}

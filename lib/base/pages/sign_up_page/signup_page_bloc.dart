import 'package:bloc/bloc.dart';
import 'package:flutterdemo/db/mongodb.dart';
import 'package:meta/meta.dart';

part 'signup_page_event.dart';

part 'signup_page_state.dart';

class SignupPageBloc extends Bloc<SignupPageEvent, SignupPageState> {
  SignupPageBloc() : super(SignupPageInitial()) {
    on<SignupPageEvent>((event, emit) async {
      if (event is SignupPageEventSubmit) {
        emit(SignupPageStateLoading());
        try {
          await MongoDatabase.insertUser(
              event.fname, event.lname, event.email, event.password);
          emit(SignupPageStateDismissLoading());
        } on Exception catch (e) {
          emit(SignupPageStateFail(e.toString()));
        }
      }
    });
  }
}

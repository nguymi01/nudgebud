import 'package:bloc/bloc.dart';
import 'package:flutterdemo/db/mongodb.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginEventClickButton){
        emit(LoginStateLoading());
        try{
          await MongoDatabase.login(event.email,event.password);
        }
        on Exception catch (e){
          emit(LoginStateFail(e.toString()));
        }
      }

    });
  }
}

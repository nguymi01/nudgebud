import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) {
      if (event is HomepageClickButtonTestEvent) {
        emit(HomepageStateShowPopUp());
      }
      if (event is HomepageEventClickStatus){
        emit(HomepageStateStatusUpdated(event.status));
      }
      if (event is HomepageEventClickTab){
        emit(HomepageStateUpdateIndex(event.index));
      }
    });
  }
}

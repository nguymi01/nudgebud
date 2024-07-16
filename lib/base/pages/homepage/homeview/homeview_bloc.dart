import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homeview_event.dart';
part 'homeview_state.dart';

class HomeviewBloc extends Bloc<HomeviewEvent, HomeviewState> {
  HomeviewBloc() : super(HomeviewInitial()) {
    on<HomeviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

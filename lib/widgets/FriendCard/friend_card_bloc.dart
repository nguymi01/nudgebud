import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'friend_card_event.dart';
part 'friend_card_state.dart';

class FriendCardBloc extends Bloc<FriendCardEvent, FriendCardState> {
  FriendCardBloc() : super(FriendCardInitial()) {
    on<FriendCardEvent>((event, emit) {
        if (event is FriendCardEventSelect){
          emit(FriendCardStateSelected(event.select));
        }
    });
  }
}

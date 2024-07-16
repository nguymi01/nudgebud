import 'package:bloc/bloc.dart';
import 'package:flutterdemo/base/tools.dart';
import 'package:meta/meta.dart';

part 'available_friends_event.dart';

part 'available_friends_state.dart';

class AvailableFriendsBloc
    extends Bloc<AvailableFriendsEvent, AvailableFriendsState> {
  AvailableFriendsBloc() : super(AvailableFriendsInitial()) {
    on<AvailableFriendsEvent>((event, emit) async{
      // List<dynamic> mockFriends = await loadData();
      // print(mockFriends);
      if (event is AvailableFriendsEventSelectDistance) {
        emit(AvailableFriendsStateShowDistance(event.selected,event.time));
      }
      else if (event is AvailableFriendsEventCallData){
        List<dynamic> mockFriends = await loadData();
        emit(AvailableFriendsStateLoadData(mockFriends));
      }
      // if (event is AvailableFriendsEventSelectTime) {
      //   emit(AvailableFriendsStateUpdateTime(event.time));
      // }
    });
  }
}

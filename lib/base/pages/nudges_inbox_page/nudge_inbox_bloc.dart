import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nudge_inbox_event.dart';
part 'nudge_inbox_state.dart';

class NudgeInboxBloc extends Bloc<NudgeInboxEvent, NudgeInboxState> {
  NudgeInboxBloc() : super(NudgeInboxInitial()) {
    on<NudgeInboxEvent>((event, emit) {
      if (event is NudgeInboxEventClickSentTab){
        emit(NudgeInboxStateSent());
      }
      else if (event is NudgeInboxEventClickReceivedTab){
        emit(NudgeInboxStateReceived());
      }
      else if (event is NudgeInboxEventClickOption){
        emit(NudgeInboxStateDisplayOption(event.type));
      }
    });
  }
}

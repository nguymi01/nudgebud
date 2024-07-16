import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nudge_filter_event.dart';

part 'nudge_filter_state.dart';

class NudgeFilterBloc extends Bloc<NudgeFilterEvent, NudgeFilterState> {
  NudgeFilterBloc() : super(NudgeFilterInitial()) {
    on<NudgeFilterEvent>((event, emit) {
      if (event is NudgeFilterEventClickButton) {
        emit(NudgeFilterStateShowChosenValue(value: event.value));
      }
    });
  }
}

import 'package:bloc/bloc.dart';

part 'expand_event.dart';
part 'expand_state.dart';

class ExpandBloc extends Bloc<ExpandableEvent, ExpandState> {
  ExpandBloc() : super(ExpandInitial()) {
    on<ExpandableEvent>((event, emit) {
      if (event == ExpandableEvent.expand) {
        emit(ExpansionTileState(selected: 1));
      } else if (event == ExpandableEvent.collapse) {
        emit(ExpansionTileState(selected: -1));
      }
    });
  }
}

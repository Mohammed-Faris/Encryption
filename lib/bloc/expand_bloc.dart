import 'package:bloc/bloc.dart';

part 'expand_event.dart';
part 'expand_state.dart';

class ExpandBloc extends Bloc<ExpandEvent, ExpandState> {
  ExpandBloc() : super(ExpandInitial()) {
    on<ExpansionTileEvent>((event, emit) {
      emit(ExpansionTileState(selected: event.index));
    });
  }
}

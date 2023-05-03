import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'duolingo_event.dart';
part 'duolingo_state.dart';

class DuolingoBloc extends Bloc<DuolingoEvent, DuolingoState> {
  DuolingoBloc() : super(DuolingoInitial()) {
    on<DuolingoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hometab_event.dart';
part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  HometabBloc() : super(HometabState(true, 0)) {
    on<ButtonPressed>(_buttonPressed);
  }

  FutureOr<void> _buttonPressed(event, Emitter<HometabState> emit) {
    emit(HometabState(true, event.buttonIndex));
  }
}

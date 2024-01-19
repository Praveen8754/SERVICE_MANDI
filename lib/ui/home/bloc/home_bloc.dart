

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  HomeBloc(): super(HomeInitialState()){

    on<HomeEvent>(_shareUserData);
    on<ValidateHomeEvent>(_shareUserData);
  }

  FutureOr<void> _shareUserData(HomeEvent event,Emitter<HomeState> emit) async {
    emit(HomeInitialState());
  }
}

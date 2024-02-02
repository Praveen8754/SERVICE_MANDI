import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'carosual_event.dart';
part 'carosual_state.dart';

class CarosualScreenBloc extends Bloc<CarosualEvent, CarosualState> {


  CarosualScreenBloc() : super(CarosualInitial()) {
    int _currentIndex = 0;
   on<PageChangedEvent>(_pageChangedEvent);

    /*on((PageChangedEvent event, emit) =>
    {

        _currentIndex = event.pageIndex,
        emit ( CarouselIndexChanged(_currentIndex)),
      event.pageIndex
    });
  }*/}


  FutureOr<void> _pageChangedEvent(CarosualEvent event, Emitter<CarosualState> emit) {
    event as PageChangedEvent;

    int _currentIndex = 0;
    _currentIndex = event.pageIndex;
    emit ( CarouselIndexChanged(_currentIndex));
  }}


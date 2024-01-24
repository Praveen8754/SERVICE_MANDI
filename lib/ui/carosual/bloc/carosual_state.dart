part of 'carosual_bloc.dart';

 class CarosualState {}

class CarosualInitial extends CarosualState {}

class CarosualLoading extends CarosualState {}

//class CarouselInitialState extends CarouselState {}

class CarouselIndexChanged extends CarosualState {
 final int currentIndex;

 CarouselIndexChanged(this.currentIndex);
}
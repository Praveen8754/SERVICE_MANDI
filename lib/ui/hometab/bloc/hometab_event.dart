part of 'hometab_bloc.dart';

@immutable
abstract class HometabEvent {}

class ButtonPressed extends HometabEvent {
  int buttonIndex;

  ButtonPressed(this.buttonIndex);
}

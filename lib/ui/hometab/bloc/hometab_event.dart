part of 'hometab_bloc.dart';

@immutable
abstract class HometabEvent {}

class ButtonPressed extends HometabEvent {
  int buttonIndex;

  ButtonPressed(this.buttonIndex);
}


abstract class OrdertabEvent{}


class ButtonPressedd extends HometabEvent {
  bool buttonIndex;

  ButtonPressedd(this.buttonIndex);
}







class FilterItems extends OrdertabEvent {
  final String filterText;


  FilterItems(this.filterText);
}
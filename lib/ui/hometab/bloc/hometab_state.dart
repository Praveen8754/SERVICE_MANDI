part of 'hometab_bloc.dart';

 class HometabState {
   bool isPressed;
   int buttonIndex;

  HometabState(this.isPressed, this.buttonIndex);
}

  class OrdertabState {}

class InitialState extends OrdertabState{final List<String> items;
InitialState(this.items);
 }

class FilteredItems extends OrdertabState {
  final List<String> items;


  FilteredItems(this.items );
}
